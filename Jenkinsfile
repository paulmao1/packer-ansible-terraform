pipeline {
    agent any
    environment {
        Subscription_Id = credentials('subscription_id')
        Client_Id = credentials('client_id')
        Client_Secret = credentials('client_secret')
        Tenant_Id = credentials('tenant_id')
    }
    stages('Software Preparing') {
            steps {
               dir('jenkins/scripts/'){
                sh 'chmod +x install.sh'
                sh './install.sh'
                }
            }
        }
    stages('Make image'){
            steps{
                dir('packer/'){
                sh "packer build -var 'subscription_id=$Subscription_Id' \
                    -var 'client_id=$Client_Id' \
                    -var 'client_secret=$Client_Secret' \
                    -var 'tenant_id=$Tenant_Id' \
                    template.json"
                echo 'Completed packer'
                }
            }
        }
    stages{
        stage('NetworkInit'){
            steps{
                dir('terraform/'){
                sh "terraform -var 'subscription_id=$Subscription_Id' \
                    -var 'client_id=$Client_Id' \
                    -var 'client_secret=$Client_Secret' \
                    -var 'tenant_id=$Tenant_Id' \
                    init"
                }
            }
        }
    }
}