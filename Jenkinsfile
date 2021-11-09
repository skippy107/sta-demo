pipeline{
    agent {
      docker {
        image 'skippy107/robotframework:latest'
        args  '-v ${WORKSPACE}:/usr/src/app'
      }
    }
    stages {
      stage('Test') {
        steps {
          sh 'export HOME=/home/docker; . $HOME/.profile; $HOME/runtests.sh'
          publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: true, reportDir: 'results', reportFiles: 'report.html', reportName: 'Test Results', reportTitles: ''])
        }
      }
    }
    post {
      failure {
        publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: true, reportDir: 'results', reportFiles: 'report.html', reportName: 'Test Results', reportTitles: ''])
      }
    }

}

