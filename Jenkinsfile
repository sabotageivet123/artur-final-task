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
        git branch: env.JOB_BASE_NAME,
            url: 'git@github.com:sabotageivet123/artur-final-task.git',
            credentialsId: 'repo_key'
      }
    }
    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
        app = docker.build(registry)
    }

    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com/', 'dockerhub') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:${env.BUILD_NUMBER}"
      }
    }
  }
}