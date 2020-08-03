# Toluna's DevOps Task:

* Terraform actions (under ./terraform directory):

$ terraform init

$ Create Service account / IAM user

$ terraform apply -auto-approve -var-file=./toluna-env.tfvars

$ terraform destroy -auto-approve -var-file=./toluna-env.tfvars

* GCP

$ gcloud init

$ gcloud container clusters get-credentials toluna --region europe-west3 --project toluna-devops

* K8s actions (under ./k8s directory)
https://kubernetes.io/docs/tutorials/stateless-application/expose-external-ip-address/
$ kubectl create deployment --image=docker.io/fadizaboura/toluna-devops toluna-devops

$ kubectl get deploy toluna-devops -o yaml > toluna-devops-deployment.yaml

$ kubectl expose deployment toluna-devops --port=5000 --name=toluna-devops-svc

$ kubectl get svc toluna-devops-svc -o yaml > toluna-devops-service.yaml


* start service and deployment pods

$ kubectl apply -f .

$ kubectl describe svc toluna-devops-svc

$ kubectl get svc

$ kubectl get pod

$ kubectl exec -it ${id} bash

$ curl localhost:5000


* docker container actions (Docker image):

$ docker build -t fadizaboura/toluna-devops:1 .

$ docker tag tolunadevops:latest fadizaboura/toluna-devops:1

$ docker login 

$ docker push fadizaboura/toluna-devops:1

