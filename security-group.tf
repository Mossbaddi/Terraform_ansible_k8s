resource "aws_security_group" "eks_control_plane_sg" {
  name        = "eks-control-plane-sg"
  description = "Security Group for EKS Control Plane"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Terraform   = "true",
    Environment = "dev"
  }
}

resource "aws_security_group_rule" "eks_control_plane_ingress_all" {
  type        = "ingress"
  from_port   = 0
  to_port     = 65535
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.eks_control_plane_sg.id
}

resource "aws_security_group" "eks_worker_nodes_sg" {
  name        = "eks-worker-nodes-sg"
  description = "Security Group for EKS Worker Nodes"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Terraform   = "true",
    Environment = "dev"
  }
}

resource "aws_security_group_rule" "eks_worker_nodes_ingress_all" {
  type        = "ingress"
  from_port   = 0
  to_port     = 65535
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.eks_worker_nodes_sg.id
}
