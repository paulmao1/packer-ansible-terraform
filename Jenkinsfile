pipeline {
    agent any
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