pipeline {
    agent any
    stages {
        stage('Software Install') {
            steps {
               dir('jenkins/scripts/'){
                sh 'chmod +x install.sh'
                sh './install.sh'
                }
            }
        }
    }
}