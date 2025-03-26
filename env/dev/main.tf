module "vpc" {
  source             = "../../modules/vpc"
  cidr_block         = var.cidr_block
  app_name           = var.app_name
  env                = var.env
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone  = var.availability_zone
  name_prefix        = local.name_prefix
}

locals {
  name_prefix = "${var.app_name}-${var.env}"
}

module "ec2" {
  source      = "../../modules/ec2"
  vpc_id      = module.vpc.vpc_id
  app_name    = var.app_name
  env         = var.env
  name_prefix = local.name_prefix
  subnet_id   = module.vpc.subnet_id
  key_name    = var.key_name
}

output "ec2_public_ip" {
  value = module.ec2.instance_public_ip
}