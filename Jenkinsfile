pipeline {
  agent any

  stages {
    stage('Parallel Testing') {
      parallel {
        stage('Unit Tests') {
          steps {
            echo 'Running unit tests...'
            sh 'chmod +x run-unit-tests.sh'
            sh './run-unit-tests.sh'
          }
        }

        stage('Integration Tests') {
          steps {
            echo 'Running integration tests...'
            sh 'chmod +x run-integration-tests.sh'
            sh './run-integration-tests.sh'
          }
        }

        stage('UI Tests') {
          steps {
            echo 'Running UI tests...'
            sh 'chmod +x run-ui-tests.sh'
            sh './run-ui-tests.sh'
          }
        }
      }
    }

    stage('Deploy') {
      when {
        expression { currentBuild.result == null || currentBuild.result == 'SUCCESS' }
      }
      steps {
        echo 'Deploying application...'
        sh 'chmod +x deploy.sh'
        sh './deploy.sh'
      }
    }
  }

  post {
    failure {
      echo 'Build failed. Tests did not pass.'
    }
    success {
      echo 'All tests passed. Deployment completed.'
      echo 'testing the trigger'
    }
  }
}

triggers {
    githubPush()
  }