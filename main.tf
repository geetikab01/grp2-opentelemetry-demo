provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
  
  project_name    = var.project_name
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "ec2_docker" {
  source = "./modules/ec2"
  
  project_name      = var.project_name
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  instance_type     = var.docker_instance_type
  ami_id            = var.ami_id
  key_name          = var.key_name
  volume_size       = var.docker_volume_size
  user_data         = file("${path.module}/user_data/docker_instance_setup.sh")
}

module "eks" {
  source = "./modules/eks"
  
  project_name       = var.project_name
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  cluster_name       = var.cluster_name
  node_group_name    = var.node_group_name
  node_instance_type = var.node_instance_type
  node_desired_size  = var.node_desired_size
  node_max_size      = var.node_max_size
  node_min_size      = var.node_min_size
}

module "ec2_eks_client" {
  source = "./modules/ec2"
  
  project_name      = var.project_name
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  instance_type     = var.client_instance_type
  ami_id            = var.ami_id
  key_name          = var.key_name
  volume_size       = var.client_volume_size
  user_data         = data.template_file.eks_client_user_data.rendered
}

data "template_file" "eks_client_user_data" {
  template = file("${path.module}/user_data/eks_client_setup.sh")
  
  vars = {
    cluster_name = var.cluster_name
    region       = var.region
  }
}  
