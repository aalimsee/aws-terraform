output "public_ip" {
  value = aws_instance.this.public_ip
}

output "subnet_id" {
  value = aws_instance.this.subnet_id
}

output "vpc_security_group_ids" {
  value = aws_instance.this.vpc_security_group_ids
}

output "instance_id" {
  value = aws_instance.this.id
}