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
        echo "${env.JOB_BASE_NAME}"
        git branch: "${env.JOB_BASE_NAME}",
            url: 'git@github.com:sabotageivet123/artur-final-task.git',
            credentialsId: 'repo_key'
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build("goserver-final", "-f application/Dockerfile .") registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
         script {
            docker.withRegistry('', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
  }
}
