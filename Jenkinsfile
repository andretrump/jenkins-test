pipeline {
    agent any
    stages {
        stage("test") {
            steps {
                echo "Testing the app..."
            }
        }

        stage("build") {
            steps {
                nodejs("Node-22.14.0") {
                    sh "npm ci"
                    sh "npm run build"
                }
            }
        }

        stage("deploy") {
            steps {
                echo "Deploying the app..."
            }
        }
    }
}