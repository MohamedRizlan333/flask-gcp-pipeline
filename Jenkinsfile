pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/MohamedRizlan333/flask-gcp-pipeline.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t mohamedrizlan/gcp-vm .'
            }
        }

        stage('Push to GCP VM via SSH') {
            steps {
                bat '''
                scp -i id_rsa -o StrictHostKeyChecking=no -r * rizlanmohamed32@34.171.220.84:/home/rizlanmohamed32/app
                '''
            }
        }

        stage('Run on GCP VM') {
            steps {
                bat '''
                ssh -i id_rsa -o StrictHostKeyChecking=no rizlanmohamed32@34.171.220.84 "
                    cd /home/your-user/app &&
                    docker stop flask-container || true &&
                    docker rm flask-container || true &&
                    docker build -t mohamedrizlan/devops-project . &&
                    docker run -d -p 5000:5000 --name flask-container mohamedrizlan/gcp-vm
                "
                '''
            }
        }
    }
}
