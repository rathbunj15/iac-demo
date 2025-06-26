terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = "default"
}

resource "tls_private_key" "ec2_ssh_priv_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "ec2_ssh_key" {
  key_name   = "minikube-ssh-key"
  public_key = tls_private_key.ec2_ssh_priv_key.public_key_openssh
}

resource "aws_instance" "ubuntu_24-04_ec2" {
    ami                         = var.aws_ubuntu_24-04_ami_id
    instance_type               = "t2.micro"
    key_name                    = aws_key_pair.ec2_ssh_key.key_name
    subnet_id                   = aws_subnet.public_subnet.id
    associate_public_ip_address = true

    vpc_security_group_ids = [
      aws_security_group.allow_ssh.id
    ]

    tags = {
        Name = "Ubuntu Minikube EC2 Instance (T2 Micro)"
    }
}

output "ec2_instance_id" {
  value = aws_instance.ubuntu_24-04_ec2.id
}

output "ec2_instance_public_ip" {
  value = aws_instance.ubuntu_24-04_ec2.public_ip
}

output "ssh_private_key" {
  value     = tls_private_key.ec2_ssh_priv_key.private_key_pem
  sensitive = true
}
