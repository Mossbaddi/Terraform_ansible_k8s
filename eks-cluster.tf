module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "17.1.0"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnets         = module.vpc.public_subnets

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }

  vpc_id = module.vpc.vpc_id

  node_groups = {
    eks_nodes = {
      desired_capacity = var.desired_capacity
      max_capacity     = var.max_capacity
      min_capacity     = var.min_capacity

      instance_type = var.instance_type
      key_name      = var.key_name
      subnet_ids    = module.vpc.public_subnets

      tags = {
        Terraform   = "true"
        Environment = "dev"
      }
    }
  }

  manage_aws_auth = true
}

