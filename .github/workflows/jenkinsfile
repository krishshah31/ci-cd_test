pipeline {
    agent any

    triggers {
        pollSCM('* * * * *')   // poll GitHub every minute
    }

    stages {
        stage('Checkout') {
            steps { checkout scm }
        }
        stage('Build') {
            steps { sh './ci_tools/build.sh' }
        }
        stage('Flash') {
            steps { sh './ci_tools/flash.sh' }
        }
        stage('Test') {
            steps {
                sh '.venv/bin/python -m pytest ci_tools -v --junitxml=results.xml'
            }
        }
    }

    post {
        always {
            junit 'results.xml'
        }
    }
}