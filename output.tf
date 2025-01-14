output "ec2_instance_public_ip" {
  value = module.ec2_instance.public_ip
}

output "elb_dns_name" {
  value = module.elb.dns_name
}

#output "eip_allocation_id" {
#  value = module.eip.allocation_id
#}

output "vpc_security_group_ids" {
  value = module.ec2_instance.vpc_security_group_ids
}
