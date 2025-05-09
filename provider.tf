terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }

  required_version = ">= 1.0.0"
}

#provider "aws" {
#  region = var.region
#}

# Create a directory to store SSH keys
resource "null_resource" "keys_directory" {
  provisioner "local-exec" {
    command = "mkdir -p ${path.module}/keys"
  }
}
