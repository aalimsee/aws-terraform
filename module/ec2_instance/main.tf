provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-05576a079321f21f8" // AWS Linux
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web.id]
  key_name               = "aalimsee-keypair" // Replace with your own key pair
  subnet_id              = aws_subnet.web.id
}

resource "aws_security_group" "web" {
  name        = "aalimsee-ec2-sg"
  description = "Allow inbound SSH traffic"
  vpc_id      = aws_vpc.web.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_subnet" "web" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.web.id
  availability_zone = "us-east-1a"
}

resource "aws_vpc" "web" {
  cidr_block = "10.0.0.0/16"
}