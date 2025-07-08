pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/MohamedRizlan333/jenkins-gcp-pipeline.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t mohamedrizlan/devops-project .'
            }
        }

        stage('Run Docker Container') {
            steps {
                bat '''
                docker stop flask-container || exit 0
                docker rm flask-container || exit 0
                docker run -d -p 5000:5000 --name flask-container mohamedrizlan/devops-project
                '''
            }
        }
    }
}
