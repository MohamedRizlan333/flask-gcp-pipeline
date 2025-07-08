pipeline {
    agent any

    environment {
        GOOGLE_APPLICATION_CREDENTIALS = 'C:\\jenkins-gcp\\gcp-key.json'
        GCP_VM_USER = 'rizlanmohamed32'
        GCP_VM_IP = '34.171.220.84'
        GCP_VM_PATH = '/home/rizlanmohamed32/app'
    }

    stages {

        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/MohamedRizlan333/jenkins-gcp-pipeline.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t mohamedrizlan/gcp-vm .'
            }
        }

        stage('Authenticate with GCP') {
            steps {
                bat 'gcloud auth activate-service-account --key-file=%GOOGLE_APPLICATION_CREDENTIALS%'
            }
        }

        stage('Copy Files to GCP VM') {
            steps {
                bat """
                    gcloud compute scp --recurse . %GCP_VM_USER%@%GCP_VM_IP%:%GCP_VM_PATH% --quiet --zone=us-central1-a
                """
            }
        }

        stage('Run Docker on GCP VM') {
            steps {
                bat """
                    gcloud compute ssh %GCP_VM_USER%@%GCP_VM_IP% --zone=us-central1-a --command="cd %GCP_VM_PATH% && docker stop flask-container || true && docker rm flask-container || true && docker build -t mohamedrizlan/gcp-vm . && docker run -d -p 5000:5000 --name flask-container mohamedrizlan/gcp-vm"
                """
            }
        }
    }
}
