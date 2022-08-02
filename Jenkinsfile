pipeline {
  environment {
    registry = "adsfadsfasdfasdf1234134sdfasdf/goserver-final"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git branch: $env.JOB_NAME,
            url: 'git@github.com:sabotageivet123/artur-final-task.git',
            credentialsId: 'repo_key'
      }
    }
    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("adsfadsfasdfasdf1234134sdfasdf/goserver-final")
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        app.inside {
            sh 'echo "Tests passed"'
        }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
  }
}
