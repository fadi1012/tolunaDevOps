provider "aws" {
  region = var.region
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  private_subnets      = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

resource "aws_eks_cluster" "" {
  name = ""
  role_arn = ""
  "vpc_config" {
    subnet_ids = ["${aws_vpc.main.id}"]
  }
}