pipeline {
    agent any 
    
    stages { 
        stage('SCM Checkout') {
            steps {
                retry(3) {
                    git branch: 'main', url: 'https://github.com/Hasitha076/node-app.git'
                }
            }
        }
        stage('Build Docker Image') {
            steps {  
                sh 'docker build -t hasitha076/nodeapp-cuban:%BUILD_NUMBER% .'
            }
        }
        stage('Login to Docker Hub') {
            steps {

                withCredentials([string(credentialsId: 'text-dockerhubpassword', variable: 'test-dockerhubpass')]) {
                    script {
                        sh "docker login -u hasitha076 -p ${test-dockerhubpass}"
                    }
                }
            }
        }
        stage('Push Image') {
            steps {
                sh 'docker push hasitha076/nodeapp-cuban:%BUILD_NUMBER%'
            }
        }
    }
    post {
        always {
            sh 'docker logout'
        }
    }
}