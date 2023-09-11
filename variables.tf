variable "region" {
  description = "AWS region"
  default     = "us-west-1"
  type        = string
}

variable "key_name" {
  description = "The key name to use for the instance"
  type        = string
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  default     = "eks-cluster"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  default     = "1.21"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EKS worker nodes"
  default     = "t2.micro"
  type        = string
}

variable "desired_capacity" {
  description = "Desired number of worker nodes"
  default     = 1
  type        = number
}

variable "min_capacity" {
  description = "Minimum number of worker nodes"
  default     = 1
  type        = number
}

variable "max_capacity" {
  description = "Maximum number of worker nodes"
  default     = 1
  type        = number
}
