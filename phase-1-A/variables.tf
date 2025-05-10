variable "region" {
  default = "us-east-1"
}

variable "ami_id" {
  default = "ami-0f88e80871fd81e91" # Amazon Linux
  type = string
  description = "The AMI ID to use for the instance"
}
variable "ec2_key_pair_name" {
  default = "Final_Project_Key_Pair"
  type = string
  description = "The name of the EC2 key pair to use for SSH access"
}

variable "aws_profile" {
  default = "finalProject"
  type = string
  description = "The AWS CLI profile to use for authentication"
}

variable "eks_cluster_name" {
  default = "otel-cluster-1"
  type = string
  description = "The eks cluster name"
}