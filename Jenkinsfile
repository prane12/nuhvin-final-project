pipeline {
    agent any 

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the Git repository
                git url: 'https://github.com/prane12/nuhvin-final-project.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image (assuming Dockerfile is present in the repo)
                    sh 'docker build -t hello-world-apache .'
                }
            }
        }

        stage('Deploy Containers') {
            steps {
                script {
                    // Stop and remove existing containers (if any)
                    sh '''
                    docker stop apache1 || true
                    docker rm apache1 || true
                    docker stop apache2 || true
                    docker rm apache2 || true
                    docker stop apache3 || true
                    docker rm apache3 || true
                    docker stop apache4 || true
                    docker rm apache4 || true
                    '''

                    // Run new containers with the specified image and ports
                    sh '''
                     docker run -d --name apache1 -p 8081:80 hello-world-apache
                     docker run -d --name apache2 -p 8082:80 hello-world-apache
                     docker run -d --name apache3 -p 8083:80 hello-world-apache
                     docker run -d --name apache4 -p 8084:80 hello-world-apache
                    '''
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment Successful!'
        }
        failure {
            echo 'Deployment Failed!'
        }
    }
}

