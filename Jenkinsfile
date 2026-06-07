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
                sh '''
                    # 1. Create the virtual environment dynamically
                    python3 -m venv .venv
                    
                    # 2. Install dependencies (modify if using a requirements.txt)
                    .venv/bin/pip install pytest pyserial
                    
                    # 3. Execute the test suite
                    .venv/bin/python -m pytest ci_tools -v --junitxml=results.xml
                '''
            }
        }
    }

    post {
        always {
            // Added allowEmptyResults so the pipeline doesn't throw a secondary 
            // error if the Build or Flash stages fail before tests execute.
            junit testResults: 'results.xml', allowEmptyResults: true
        }
    }
}