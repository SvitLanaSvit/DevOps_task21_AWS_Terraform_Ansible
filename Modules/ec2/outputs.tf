output "instance_public_ips" {
  value = [for instance in aws_instance.nginx : instance.public_ip]
  description = "Public IPs of the created EC2 instances"
}
