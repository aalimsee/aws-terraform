# elb/main.tf
variable "name" {
  type = string
  default = "aalimsee-elb"
}

variable "security_groups" {
  type = list(string)
  default = [ "aalimsee-allow-ssh-http","aalimsee-allow-https" ]
}

variable "subnet_id" {
  type = list(string)
  default = [ "subnet-009c26a2bc10958c3" ]
  description = "aalimsee-subnet-public1-us-east-1a"
}

 variable "vpc_security_group_ids" {
  type = list(string)
  default = [ "sg-0053cba12d2b37d95","sg-08a7acb33f2cb80f9" ]
  description = "aalimsee-allow-ssh-http and https"
}

resource "aws_elb" "this" {
  name            = var.name
  subnets         = var.subnet_id
  security_groups = var.vpc_security_group_ids

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
}

output "dns_name" {
  value = aws_elb.this.dns_name
}
