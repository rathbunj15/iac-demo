#!/bin/bash

if [ $(basename $PWD) != "terraform" ]; then
    echo "Current directory context is not in the terraform directory. Switching context..."
    cd terraform
fi

# # Initialize, Plan, and Apply the configuration.
terraform init && terraform plan && terraform apply -auto-approve

mkdir -p ~/.ssh
terraform output -raw ssh_private_key > ~/.ssh/ec2_key