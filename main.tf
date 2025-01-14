module "ec2_instance" {
  source = file("./ec2_instance")
  # why no depends_on?
}

module "elb" {
  source = file("./elb")
  depends_on = [module.ec2_instance]
}

module "eip" {
  source = file("./eip")
  depends_on = [module.elb]
}