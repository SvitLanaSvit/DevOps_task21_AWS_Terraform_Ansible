variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "vpc_id" {
  type = string
  description = "ID of the VPC for EC2 instance"
}

variable "subnet_id" {
  type = string
  description = "ID of the subnet for EC2 instance"
}

variable "security_group_id" {
  type = string
  description = "ID of the security group for EC2 instance"
}

variable "instance_type" {
  type = string
  description = "EC2 instance type"
  default = "t2.micro"
}

variable "ami_id" {
  type = string
  description = "AMI ID for EC2 instance"
}

variable "resource_name" {
  type = string
  description = "Name for resources (optional, for tags)"
  default = "ec2"
}

variable "common_tags" {
  type = map(string)
  description = "Common tags for resources"
  default = {}
}

variable "key_name" {
  type        = string
  description = "Name of the SSH key pair for EC2"
}