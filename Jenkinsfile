pipeline {
    agent any
    environment {
        Subscription_Id = credentials('subscription_id')
        Client_Dd = credentials('client_id')
        Client_Secret = credentials('client_secret')
        Tenant_Id = credentials('tenant_id')
    }
    stages {
        stage('Software Preparing') {
            steps {
               dir('jenkins/scripts/'){
                sh 'chmod +x install.sh'
                sh './install.sh'
                }
            }
        }
        stage('Make image'){
            steps{
                dir('packer/'){
                sh 'packer build template.json'
                echo 'Completed packer'
                }
            }

        }
    }
}