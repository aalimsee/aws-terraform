module "ec2_instance" {
  source = file("./module/ec2_instance")
  # why no depends_on?
}

module "elb" {
  source = file("./module/elb")
  depends_on = [module.ec2_instance]
}

module "eip" {
  source = file("./module/eip")
  depends_on = [module.elb]
}