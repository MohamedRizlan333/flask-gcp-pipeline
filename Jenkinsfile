pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/MoahmedRizlan333/jenkins-gcp-pipeline.git'
            }
        }
        stage('Setup Python Environment') {
            steps {
                sh '''
                    python3 -m venv venv
                    source venv/bin/activate
                    pip install --upgrade pip
                    pip install -r requirements.txt
                '''
            }
        }
        stage('Deploy') {
            steps {
                sh '''
                    source venv/bin/activate
                    chmod +x deploy.sh
                    ./deploy.sh
                '''
            }
        }
    }
}
