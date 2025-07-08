pipeline {
    agent any

    environment {
        GOOGLE_APPLICATION_CREDENTIALS = 'C:\\jenkins-gcp\\gcp-key.json'
    }

    stages {
        stage('Authenticate with GCP') {
            steps {
                bat 'gcloud auth activate-service-account --key-file=%GOOGLE_APPLICATION_CREDENTIALS%'
            }
        }

        stage('Copy Files to GCP VM') {
            steps {
                bat 'gcloud compute scp --recurse * rizlanmohamed32@jenakins-vm:/home/rizlanmohamed32/app --zone=your-vm-zone --project=your-project-id'
            }
        }

        stage('Run Docker on VM') {
            steps {
                bat 'gcloud compute ssh rizlanmohamed32@jenakins-vm --zone=your-vm-zone --command="cd /home/rizlanmohamed32/app && docker build -t mohamedrizlan/devops-project . && docker run -d -p 5000:5000 mohamedrizlan/devops-project"'
            }
        }
    }
}
