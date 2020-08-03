provider "google" {
  credentials = file("/home/fadi/Downloads/toluna-devops-03cf89b4eeb2.json")
  project = var.project_id
  region  = var.region
}

module "network" {
  source = "./modules/network"
  vpc_name = var.vpc_name
  subnet_cidr_block = var.subnet_cidr_block
  region = var.region
}

module "gke" {
  source = "./modules/gke"
  cluster_name = var.cluster_name
  region  = var.region
}