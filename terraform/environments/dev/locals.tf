locals {
  common_tags = {
    "environment"   = var.environment
    "managed_by_tf" = "true"
  }

  resource_name = "nginx-${var.environment}"

  ssh_allowed_cidr = "${chomp(data.http.my_ip.response_body)}/32"
}