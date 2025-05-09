#!/bin/bash
set -e

# Update system packages
yum update -y

# Install utilities
yum install -y wget curl git unzip jq

# Install AWS CLI v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install
rm -rf aws awscliv2.zip

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl"
chmod +x kubectl
mv kubectl /usr/local/bin/

# Install eksctl
ARCH=arm64
PLATFORM=$(uname -s)_$ARCH
curl -sLO "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"
tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz
mv /tmp/eksctl /usr/local/bin

# Install Docker
amazon-linux-extras install docker -y
systemctl start docker
systemctl enable docker
usermod -a -G docker ec2-user

# Configure kubectl for EKS
aws eks update-kubeconfig --region ${region} --name ${cluster_name}

# Install helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# Clone OpenTelemetry Demo Repository
mkdir -p /home/ec2-user/opentelemetry-demo
git clone https://github.com/open-telemetry/opentelemetry-demo.git /home/ec2-user/opentelemetry-demo
chown -R ec2-user:ec2-user /home/ec2-user/opentelemetry-demo

echo "Setup completed!" > /home/ec2-user/setup_complete.txt
