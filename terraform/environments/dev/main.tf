module "network" {
  source            = "../../../modules/network"
  vpc_id            = data.aws_vpc.default.id
  list_of_open_ports = [80, 443]
  resource_name     = local.resource_name //"nginx-network"
  common_tags       = local.common_tags

  ssh_allowed_cidr  = local.ssh_allowed_cidr
}

module "ec2" {
  source            = "../../../modules/ec2"
  vpc_id            = data.aws_vpc.default.id
  subnet_id         = data.aws_subnet.default.id
  security_group_id = module.network.security_group_id
  ami_id            = data.aws_ami.ubuntu.id
  instance_type     = var.instance_type
  resource_name     = local.resource_name //"nginx-ec2"
  common_tags       = local.common_tags
  key_name         = aws_key_pair.ansible.key_name
}

resource "aws_key_pair" "ansible" {
  key_name   = "ansible-key"
  public_key = var.public_key_content
}

resource "local_file" "ansible_inventory" {
  content  = data.template_file.ansible_inventory.rendered
  filename = "${path.module}/ansible_hosts"
}