module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.77.0"

  # Nom du VPC
  name = "eks-vpc"
  
  # Plage d'adresses CIDR pour le VPC
  cidr = "10.0.0.0/16"

  # Zones de disponibilité dans lesquelles les sous-réseaux seront créés
  azs = ["${var.region}a", "${var.region}b"]

  # Plages d'adresses CIDR pour les sous-réseaux privés
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]

  # Plages d'adresses CIDR pour les sous-réseaux publics
  public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]

  # Configuration pour le NAT Gateway
  enable_nat_gateway = false
  single_nat_gateway = true

  # Activation du support DNS pour le VPC
  enable_dns_hostnames = true
  enable_dns_support   = true
}

# Groupes de sécurité pour le VPC
resource "aws_security_group" "eks_default" {
  name        = "eks_default"
  description = "Default security group for EKS"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group_rule" "eks_ingress" {
  type        = "ingress"
  from_port   = 0
  to_port     = 65535
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.eks_default.id
}
