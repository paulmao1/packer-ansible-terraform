pipeline {
    agent any
    environment {
        Subscription_Id = credentials('subscription_id')
        Client_Id = credentials('client_id')
        Client_Secret = credentials('client_secret')
        Tenant_Id = credentials('tenant_id')
    }
    stages{
        stage('Software Preparing') {
            steps {
               dir('jenkins/scripts/'){
                sh 'chmod +x install.sh'
                sh './install.sh'
                }
            }
        }
        stage('NetworkInit'){
            steps{
                dir('terraform/'){
                sh "terraform init"
                }
            }
        }
        stage('NetworkPlan'){
            steps{
                dir('terraform/'){
                sh "terraform plan -out networking-tflan;echo \$? > status"
                stash name: "networking-plan",includes:"networking-tflan"
                }
            }
        }
    }
}