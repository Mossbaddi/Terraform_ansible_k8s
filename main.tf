provider "aws" {
  region  = "us-west-1" # Vous pouvez changer la région selon vos préférences
  version = "~> 3.0"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.77.0"

  name                 = "eks-vpc"
  cidr                 = "10.0.0.0/16"
  azs                  = ["us-west-1a", "us-west-1b"]
  private_subnets      = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets       = ["10.0.101.0/24", "10.0.102.0/24"]
  enable_nat_gateway   = false
  single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "17.1.0"
  cluster_name    = "eks-cluster"
  cluster_version = "1.21"
  subnets         = module.vpc.public_subnets

  node_groups = {
    eks_nodes = {
      desired_capacity = 1
      max_capacity     = 1
      min_capacity     = 1

      instance_type = "t2.micro"
      key_name      = var.key_name
      subnet_ids    = module.vpc.public_subnets
    }
  }
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane."
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group id attached to the EKS cluster."
  value       = module.eks.cluster_security_group_id
}

output "cluster_iam_role_name" {
  description = "IAM role name attached to EKS cluster."
  value       = module.eks.cluster_iam_role_name
}

output "public_subnets" {
  description = "Public Subnets"
  value       = module.vpc.public_subnets
}
