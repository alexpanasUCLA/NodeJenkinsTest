
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




Screenshot 1: Pipeline fails testing stage. 
Screenshot 2: Proper working pipeline after change in the test. 







