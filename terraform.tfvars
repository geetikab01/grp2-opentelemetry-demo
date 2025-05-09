region              = "us-east-1"
project_name        = "grp2-opentelemetry-demo"
vpc_cidr            = "10.0.0.0/16"
public_subnets      = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets     = ["10.0.3.0/24", "10.0.4.0/24"]
docker_instance_type = "t3.large"
client_instance_type = "t3.medium"
# Use an Amazon Linux 2 AMI that works with ARM64 (for M1 compatibility)
ami_id              = "ami-0d8e66c96752692a1"  # Update with the correct AMI for us-east-1
key_name            = "grp2-final-keypair"
docker_volume_size  = 16
client_volume_size  = 8
cluster_name        = "opentelemetry-eks-cluster"
node_group_name     = "opentelemetry-node-group"
node_instance_type  = "t3.large"
node_desired_size   = 2
node_max_size       = 3
node_min_size       = 2
