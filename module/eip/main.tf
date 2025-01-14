# eip/main.tf
variable "allocation_id" {
  type = string
}

variable "instance_id" {
  type = string
}

resource "aws_eip" "this" {
  allocation_id = var.allocation_id
  instance_id   = var.module.ec2_instance.instance_id
}

output "allocation_id" {
  value = aws_eip.this.allocation_id
}