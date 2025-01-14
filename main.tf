# main.tf

module "ec2_instance" {
  source                 = "./module/ec2_instance"
  ami                    = "ami-05576a079321f21f8"
  instance_type          = "t2.micro"
  vpc_security_group_ids = var.vpc_security_group_ids
  key_name               = "aalimsee-keypair"
  subnet_id              = "var.subnet_id"
}

module "elb" {
  source          = "./module/elb"
  name            = "aalimsee-elb"
  subnet_id       = var.subnet_id
  security_groups = var.vpc_security_group_ids
  depends_on      = [module.ec2_instance]
}

#module "eip" {
#  source        = "./module/eip"
#  allocation_id = "aalimsee-eip"
#  instance_id   = module.ec2_instance.instance_id
#  depends_on    = [module.elb]
#}
