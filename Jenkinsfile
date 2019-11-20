pipeline {
    agent any
    environment {
        Subscription_Id = credentials('ARM_SUBSCRIPTION_ID')
        Client_Id = credentials('ARM_CLIENT_ID')
        Client_Secret = credentials('ARM_CLIENT_SECRET')
        Tenant_Id = credentials('ARM_TENANT_ID')
    }
    stages{
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