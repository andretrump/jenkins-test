def build

pipeline {
    agent any

    tools {
        nodejs "Node-22.14.0"
    }

    stages {
        stage("init") {
            steps {
                script {
                    build = load "jenkins/build.groovy"
                }
            }
        }

        stage("test") {
            steps {
                echo "Testing the app..."
            }
        }

        stage("build") {
            steps {
                script {
                    build.execute()
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