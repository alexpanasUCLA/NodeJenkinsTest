
Step 1: The Scope of the Project.

Project implements CI/CD framework for simple Node.js application (Express server that sends a text string as a response to / endpoint). It also uses Jasmin testing framework that tests if the correct text string returns. 

Jenkins runs on the separate EC2 instance. K8S cluster runs on Amazon EKS (kubernetes as a service). eksctl tool is used to deploy CloudFormation scripts to
initialize the cluster with name testCluster1. 

Docker images are deployed to DockerHub. Rolling update strategy for deployment is implemented. 

Step 2: Use of Jenkins. 

Jenkins file is attached. Pipiline install needed dependencies, test using Jasmine,
creates an image and deployes it to DockerHub. Tag is dynamic and is ${BUILD_NUMBER}. Docker, kubectl, and eksctl are installed on the EC2 instance. Rolling strategy is implemented in deployment file for the application (see pod-simple.yaml). A script in changeTag.sh dynamically changes tag in the deployment file (creates new one with changed tag). 

Step 3: Kubernetes cluster. 

Amazon EKS is used as it uses CloudFormation to build cluster and simplifies work with VPC, LoadBalancer, and AutoScaling Group. `eksctl create cluster --name testCluster1` is used to deploy underlying CloudFormation files. 

Step 4: Building Pipeline. 

Pipeline frees space by deleting unused image on Jenkins server, and implements dynamic tag change using `changeTag.sh` script. 

Step 5: Testing the pipeline. 
I changed the word in my app from 'Rolling Update!' to 'Super Update' and pushed 
to GitHub, and initiated deployment by Jenkins using Rolling Update Strategy. 
Rolling Update - Screens 3 - shows before the update. And Screens 4 - after the update. `kubectl describe deployments` shows change in the docker imaged deployed, and `http://a6c03b6f9cc444468bb400e06b1beb8a-779590944.us-west-2.elb.amazonaws.com:3000/` - I hope you can see the app currently running. 


GitHub link `https://github.com/alexpanasUCLA/NodeJenkinsTest`




Screenshot 1: Pipeline fails testing stage. 
Screenshot 2: Proper working pipeline after change in the test. 
Screenshot 3: 1-2-3 show state of cluster and pods before update. 
Screenshot 4: 1-2-2 show state after the upgrade. 
Screenshot 5: CloudFormation stack deployments by eks tool. 







