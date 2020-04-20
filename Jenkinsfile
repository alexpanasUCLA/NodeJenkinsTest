pipeline {
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

  }
}