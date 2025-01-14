provider "aws" {
  region = "us-east-1"
}

resource "aws_eip" "eip" {
  vpc = true
}

resource "aws_eip_association" "eip" {
  allocation_id = aws_eip.eip.id
  instance_id   = aws_elb.eip.id
}