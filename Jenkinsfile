pipeline {
    agent any

    tools {
        maven 'Maven3'
        jdk 'JDK17'
    }
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/RoyalBong/spring-boot-docker-DevOps-trial.git', branch: 'main'
            }
        }
        stage('Build and Test') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t spring-boot-app:latest .'
            }
        }
        stage('Run Docker Container') {
            steps {
                sh 'docker stop spring-boot-container || true'
                sh 'docker rm spring-boot-container || true'
                sh 'docker run -d -p 8080:8080 --name spring-boot-container spring-boot-app:latest'
            }
        }
    }
    post {
        always {
            sh 'docker logs spring-boot-container || true'
        }
        success {
            echo 'Build and deployment successful!'
        }
        failure {
            echo 'Build or deployment failed.'
        }
    }
}