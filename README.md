# Toluna's DevOps Task:

# Terraform actions (under ./terraform directory):

- terraform init

- Create Service account / IAM user

- terraform apply -auto-approve -var-file=./toluna-env.tfvars

- terraform destroy -auto-approve -var-file=./toluna-env.tfvars

# GCP

- gcloud login

- gcloud container clusters get-credentials toluna --region europe-west3 --project toluna-devops


# start service and deployment pods (under ./k8s directory)

- kubectl apply -f .

- kubectl port-forward service/toluna-devops-svc 5000:80

- kubectl describe svc toluna-devops-svc

- kubectl get svc

- kubectl get pod

- kubectl exec -it ${id} bash

- curl localhost:5000

- http://localhost:5000/


# docker container actions (Docker image):

- docker build -t fadizaboura/toluna-devops:1 .

- docker tag tolunadevops:latest fadizaboura/toluna-devops:1

- docker login 

- docker push fadizaboura/toluna-devops:1


# TODO/Improvements:

- tf state : 
1) should be stored in gcp bucket in order to be encrypted
2) race condition - saw that in aws it's done using dynamoDB - need to check how it's done in GCP

- provider credentials - should find a service account to store into, then with tf we can get it as a data source
now it's stored locally

- load balancer + private subnests - currently there is one public subnet

- service type - change to load balancer in order to have an ip which is reachable through http 
currently my service type is ClusterIp i need to do port forwarding  kubectl port-forward service/toluna-devops-svc 5000:80

# Nice to have 
- monitoring solution. make sure that we are up.



# K8s actions (under ./k8s directory)
https://kubernetes.io/docs/tutorials/stateless-application/expose-external-ip-address/
- kubectl create deployment --image=docker.io/fadizaboura/toluna-devops toluna-devops

- kubectl get deploy toluna-devops -o yaml > toluna-devops-deployment.yaml

- kubectl expose deployment toluna-devops --port=5000 --name=toluna-devops-svc

- kubectl get svc toluna-devops-svc -o yaml > toluna-devops-service.yaml

