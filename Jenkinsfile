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
          archiveArtifacts "${WORKSPACE}/results/*"
        }
      }
    }
    post {
      failure {
        archiveArtifacts "${WORKSPACE}/results/*"
      }
    }

}