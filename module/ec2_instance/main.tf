# ec2_instance/main.tf

resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  key_name               = var.key_name
  subnet_id             = var.subnet_id
}
