data "http" "my_ip" {
  url = "https://checkip.amazonaws.com"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "aws_subnet" "default" {
  id = data.aws_subnets.default.ids[0]
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

data "template_file" "ansible_inventory" {
  template = file("${path.module}/ansible_hosts.tpl")
  vars = {
    ec2_ips = join("\n", module.ec2.instance_public_ips)
  }
}
