pipeline {

   environment {
    registry = "dockerpanas/docker-test"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }  

  agent any
 
  tools {nodejs "Node-build"}
 
 
  stages {
    stage('Example') {
      steps {
        sh 'npm config ls'
      }
    }
    stage('Install dependencies') {
      steps {
        sh 'npm install'
      }
    }

     stage('Test') {
      steps {
         sh 'npm test'
      }
    } 
     stage('Initialize Docker'){
         steps{
           script{
            def dockerHome = tool 'myDocker'
            env.PATH = "${dockerHome}/bin:${env.PATH}"
               
           }
         }   
    }

     stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }

      stage('Deploy Image') {
      steps{
         script {
            docker.withRegistry( '', registryCredential ) {
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