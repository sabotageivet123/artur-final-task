pipeline {
  environment {
    registry = "adsfadsfasdfasdf1234134sdfasdf/goserver-final"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent {label "myLabel"}
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
          dir("application") {
            dockerImage = docker.build registry + ":${env.JOB_BASE_NAME}-$BUILD_NUMBER"
          }
        }
      }
    }
    stage('Deploy Image') {
      steps{
         script {
            docker.withRegistry('https://registry.hub.docker.com', registryCredential ) {
              dockerImage.push()
          }
        }
      }
    }
    stage('Deploy to webserver version on Kubernetes') {
      agent { label 'kuber' }
        steps{
          script {
              sh "kubectl set image deployment/goserver goserver-final=adsfadsfasdfasdf1234134sdfasdf/goserver-final:${env.JOB_BASE_NAME}-$BUILD_NUMBER"
            }
          }
        }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:${env.JOB_BASE_NAME}-$BUILD_NUMBER"
      }
    }
 }
}