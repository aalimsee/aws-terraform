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
