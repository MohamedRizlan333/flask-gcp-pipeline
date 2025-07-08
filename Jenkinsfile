pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/MohamedRizlan333/jenkins-gcp-pipeline.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t mohamedrizlan/devops-project .'
            }
        }

        stage('Copy Files to GCP') {
            steps {
                bat 'scp -i C:\\Users\\user\\Desktop\\j\\id_rsa -o StrictHostKeyChecking=no -r * rizlanmohamed32@34.171.220.84:/home/rizlanmohamed32/app'

            }
        }

        stage('Run on GCP') {
            steps {
                bat 'scp -i C:\\Users\\user\\Desktop\\j\\id_rsa -o StrictHostKeyChecking=no -r * rizlanmohamed32@34.171.220.84:/home/rizlanmohamed32/app'

            }
        }
    }
}
