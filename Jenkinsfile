pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/MoahmedRizlan333/jenkins-gcp-pipeline.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t flask-app:latest .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '''
                    docker stop flask-container || true
                    docker rm flask-container || true
                    docker run -d -p 5000:5000 --name flask-container flask-app:latest
                '''
            }
        }
    }
}
