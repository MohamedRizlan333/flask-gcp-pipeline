pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/YourUsername/jenkins-gcp-pipeline.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                sh 'pip3 install -r requirements.txt'
            }
        }
        stage('Deploy to GCP VM') {
            steps {
                sh './deploy.sh'
            }
        }
    }
}
