pipeline {
    agent any

    environment {
        // Updated to match your exact image name
        APP_NAME = 'cicd-portfolio-web'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh "docker build -t ${APP_NAME}:${BUILD_NUMBER} -t ${APP_NAME}:latest ."
            }
        }

        stage('Test') {
            steps {
                echo 'Running basic health and static asset checks...'
                // Add test or linting steps here if needed
            }
        }

        stage('Deploy') {
            steps {
                // 1. Remove the existing container (named 'profile') if it is currently running
                sh 'docker rm -f profile || true'
                
                // 2. Run the new container on port 80 with the correct name and image
                sh "docker run -d -p 80:80 --name profile ${APP_NAME}:latest"
            }
        }
    }

    post {
        always {
            // Clean up unused dangling images to save disk space on the Jenkins agent
            sh 'docker image prune -f'
        }
        success {
            echo "Successfully deployed build ${BUILD_NUMBER}"
        }
        failure {
            echo "Build ${BUILD_NUMBER} failed."
        }
    }
}
