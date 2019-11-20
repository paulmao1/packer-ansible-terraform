pipeline {
    agent any
    environment {
        Subscription_Id = credentials('subscription_id')
        Client_Id = credentials('client_id')
        Client_Secret = credentials('client_secret')
        Tenant_Id = credentials('tenant_id')
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