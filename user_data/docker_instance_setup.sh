#!/bin/bash
set -e

# Update system packages
yum update -y

# Install utilities
yum install -y wget curl git unzip jq

# Install Docker
amazon-linux-extras install docker -y
systemctl start docker
systemctl enable docker
usermod -a -G docker ec2-user

# Install Docker Compose
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-linux-aarch64" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Clone OpenTelemetry Demo Repository
mkdir -p /home/ec2-user/opentelemetry-demo
git clone https://github.com/open-telemetry/opentelemetry-demo.git /home/ec2-user/opentelemetry-demo
chown -R ec2-user:ec2-user /home/ec2-user/opentelemetry-demo

# Set up Docker Compose environment
cd /home/ec2-user/opentelemetry-demo
docker-compose up -d

echo "Setup completed!" > /home/ec2-user/setup_complete.txt
