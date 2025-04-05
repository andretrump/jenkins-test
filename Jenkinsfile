pipeline {
    agent any

    tools {
        nodejs "Node-22.14.0"
    }

    stages {
        stage("test") {
            steps {
                echo "Testing the app..."
            }
        }

        stage("build") {
            steps {
                sh "npm ci"
                sh "npm run build"
            }
        }

        stage("deploy") {
            steps {
                echo "Deploying the app..."
            }
        }
    }
}