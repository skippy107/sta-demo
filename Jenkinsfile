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
          archiveArtifacts "/usr/src/app/results/*"
        }
      }
    }
    post {
      failure {
        archiveArtifacts "/usr/src/app/results/*"
      }
    }

}