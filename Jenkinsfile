pipeline {

   environment {
    registry = "dockerpanas/docker-test"
    registryCredential = 'dockerhub'
    dockerImage = ''
    eksRegion = 'us-west-2'
    eksClusterName = 'testCluster1'
  }  

  agent any
 
  tools {nodejs "Node-build"}
 
 
  stages {
  
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

    stage('Deploy to K8S AWS') {
     steps {

          sh '/bin/chmod +x changeTag.sh'
          sh './changeTag.sh $BUILD_NUMBER'
          sh '$(which aws) eks --region ${eksRegion} update-kubeconfig --name ${eksClusterName}'
          sh '$(which kubectl) apply -f pod-simple-updated.yaml'
        
      }
    }



  }
}