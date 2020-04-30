pipeline {

   environment {
    registry = "dockerpanas/docker-test"
    registryCredential = 'dockerhub'
    dockerImage = ''
    eksRegion = 'us-west-2'
    eksClusterName = 'testCluster'
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
    //  stage('Initialize Docker'){
    //      steps{
    //        script{
    //         def dockerHome = tool 'myDocker'
    //         env.PATH = "${dockerHome}/bin:${env.PATH}"
               
    //        }
    //      }   
    // }

    //  stage('Building image') {
    //   steps{
    //     script {
    //       dockerImage = docker.build registry + ":$BUILD_NUMBER"
    //     }
    //   }
    // }

    //   stage('Deploy Image') {
    //   steps{
    //      script {
    //         docker.withRegistry( '', registryCredential ) {
    //         dockerImage.push()
    //       }
    //     }
    //   }
    // }

    //  stage('Remove Unused docker image') {
    //   steps{
    //     sh "docker rmi $registry:$BUILD_NUMBER"
    //   }
    // }

    stage('Deploy to K8S AWS') {
     steps {

      
          sh '$(which aws) eks --region=${eksRegion} update-kubeconfig --name ${eksClusterName}'
          sh '$(which kubectl) apply -f pod-simple.yaml'
        
         
        //  withAWS(credentials:'aws-static',region: eksRegion){
        //     sh '/home/ubuntu/.local/bin/aws eks --region=${eksRegion} update-kubeconfig --name ${eksClusterName}'
        //     sh 'kubectl apply -f pod-simple.yaml'
        //  }
      }
    }



  }
}