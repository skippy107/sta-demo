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
          // archiveArtifacts "results/*"
          publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'results/*', reportFiles: 'report.html', reportName: 'Test Results', reportTitles: ''])
        }
      }
    }
    post {
      failure {
        // archiveArtifacts "results/*"
        publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'results/*', reportFiles: 'report.html', reportName: 'Test Results', reportTitles: ''])
      }
    }

}