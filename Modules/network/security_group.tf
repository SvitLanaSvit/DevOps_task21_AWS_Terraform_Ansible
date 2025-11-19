resource "aws_security_group" "main" {
  name        = var.resource_name
  description = "Security group allowing access to specified ports from anywhere"
  vpc_id      = var.vpc_id

  # HTTP/HTTPS – з var.list_of_open_ports (80, 443)
  dynamic "ingress" {
    for_each = var.list_of_open_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  # SSH – тільки з поточного зовнішнього IP (/32)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_allowed_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.common_tags, { "Name" = var.resource_name })
}
