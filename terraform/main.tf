terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 6.0"
        }
    }
}

variable "ubuntu_24.04_ami_id" {
    description = "Ubuntu 24.04 LTS AMI ID for us-east-1"
    type        = string
    default     = "ami-020cba7c55df1f615"
}

variable "ec2_instance_map" {
    description = "List of EC2 instance names to create"
    type = list(
        object(
            {
                name = string
                ami  = string
            }
        )
    )
    default = [
        { 
            name = "EC2-t2.micro-A", 
            ami = var.ubuntu_24.04_ami_id
        },
        { 
            name = "EC2-t2.micro-B", 
            ami = var.ubuntu_24.04_ami_id
        }
    ]
}

    
provider "aws" {
    region = "us-east-1"
    profile = "default"
}

module "ec2_instances" {
    source = "../"
}
