provider "aws" {
  region = "us-east-1"
}

resource "aws_elb" "elb" {
  name            = "aalimsee-elb"
  subnets         = [aws_subnet.elb.id]
  security_groups = [aws_security_group.elb.id]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
}

resource "aws_security_group" "elb" {
  name        = "aalimsee-elb-sg"
  description = "Allow inbound HTTP traffic"
  vpc_id      = aws_vpc.elb.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}