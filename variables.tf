variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "grp2-opentelemetry-demo"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "List of private subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "docker_instance_type" {
  description = "Instance type for the Docker EC2 instance"
  type        = string
  default     = "t3.large"  # Recommended: at least large instance
}

variable "client_instance_type" {
  description = "Instance type for the EKS client EC2 instance"
  type        = string
  default     = "t3.medium"
}

variable "ami_id" {
  description = "AMI ID for EC2 instances (Amazon Linux 2)"
  type        = string
  # Default Amazon Linux 2 AMI for arm64 architecture (M1 compatibility)
  default     = "ami-0d8e66c96752692a1"  # Update with the correct AMI for your region
}

variable "key_name" {
  description = "Name of the SSH key pair to use for EC2 instances"
  type        = string
  default     = "grp2-final-keypair"
}

variable "docker_volume_size" {
  description = "Size of the EBS volume for Docker instance in GB"
  type        = number
  default     = 16
}

variable "client_volume_size" {
  description = "Size of the EBS volume for EKS client instance in GB"
  type        = number
  default     = 8
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "opentelemetry-eks-cluster"
}

variable "node_group_name" {
  description = "Name of the EKS node group"
  type        = string
  default     = "opentelemetry-node-group"
}

variable "node_instance_type" {
  description = "Instance type for the EKS worker nodes"
  type        = string
  default     = "t3.large"  # Required: large instance
}

variable "node_desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2  # Required: at least 2 worker nodes
}

variable "node_max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 3
}

variable "node_min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 2
}

