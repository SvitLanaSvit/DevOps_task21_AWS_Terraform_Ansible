variable "aws_region" {
  type    = string
}

variable "environment" {
  type = string
}

variable "instance_type" {
  type    = string
}

variable "public_key_content" {
  type        = string
  description = "Public SSH key for AWS key pair creation"
}