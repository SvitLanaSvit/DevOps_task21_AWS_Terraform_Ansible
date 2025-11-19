variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "vpc_id" {
  type = string
  description = "ID of the VPC where security group will be created"
}

variable "list_of_open_ports" {
  type = list(number)
  description = "List of ports to open in the security group"
}

variable "resource_name" {
  type = string
  description = "Name for resources (optional, for tags)"
  default = "network"
}

variable "common_tags" {
  type = map(string)
  description = "Common tags for resources"
  default = {}
}

variable "ssh_allowed_cidr" {
  type        = string
  description = "CIDR, який має доступ до SSH (порт 22)"
}