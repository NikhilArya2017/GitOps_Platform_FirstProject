#!/bin/bash

set -e

echo "Updating system packages..."
sudo yum update -y

echo "Installing Git..."
sudo yum install -y git unzip curl wget

echo "Installing Terraform..."

TERRAFORM_VERSION="1.13.4"

wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip

unzip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip

sudo mv terraform /usr/local/bin/

rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip

echo "Installing kubectl..."

curl -LO "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

chmod +x kubectl

sudo mv kubectl /usr/local/bin/

echo "Verifying installations..."

echo "Git Version:"
git --version

echo "Terraform Version:"
terraform version

echo "Kubectl Version:"
kubectl version --client

echo "Installation completed successfully."
