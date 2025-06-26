variable "aws_region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "aws_ec2_instance_type" {
  description = "The type of EC2 instance to build"
  type        = string
  default     = "t2.micro"
}

variable "aws_ubuntu_24-04_ami_id" {
  description = "Ubuntu 24.04 LTS AMI ID for us-east-1"
  type        = string
  default     = "ami-020cba7c55df1f615"
}

variable "aws_vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "aws_public_subnet_cidr_block" {
  description = "CIDR for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "aws_private_subnet_cidr_block" {
  description = "CIDR for the subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "minikube_cluster_name" {
  description = "Minikube cluster name"
  type        = string
  default     = "test-cluster"
}