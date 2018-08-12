pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh './gradlew build'
		sh 'docker build -t minicat:latest .'
      }
    }

    stage('Create feature environment') {
      when {
        expression { env.BRANCH_NAME != 'master' }
      }

      steps {
        createEnvironment(env.BRANCH_NAME)
      }
    }
  }
}

def createEnvironment(name) {

  sh "docker stop minicat-${name}  || :"
  sh "docker rm minicat-${name} || :"

  sh "docker run --name minicat-${name} -d minicat:latest"

}