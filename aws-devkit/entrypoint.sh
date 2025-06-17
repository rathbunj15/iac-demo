#!/bin/bash

login_to_aws() {
    echo "AWS credentials not found or expired. Please enter your AWS credentials:"
    read -p "AWS Access Key ID: " aws_access_key_id
    read -sp "AWS Secret Access Key aws_secret_access_key: " aws_secret_access_key
    echo

    read -p "Default Region Name [us-east-1]: " aws_region
    aws_region=${aws_region:-us-east-1}

    aws configure set aws_access_key_id "$aws_access_key_id"
    aws configure set aws_secret_access_key "$aws_secret_access_key"
    aws configure set region "$aws_region"
    echo "AWS credentials configured."
}

echo 'befoire'
if ! aws sts get-caller-identity &> /dev/null; then
    login_to_aws
else
    echo
    echo "AWS credentials are already configured. Proceeding..."
fi

echo 
echo "Welcome to the AWS DevKit!"

exec /bin/bash