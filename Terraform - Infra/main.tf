module "vpc" {
  source            = "./modules/VPC"
  vpc_cidr_block    = var.primary_vpc_cidr_block
  vpc_dns_support   = var.primary_vpc_dns_support
  vpc_dns_hostnames = var.primary_vpc_dns_hostnames
  tags              = var.primary_vpc_tags
}

module "public_subnet" {
  source               = "./modules/Subnet"
  vpc_id               = module.vpc.vpc_id
  subnet_cidr_block    = var.primary_public_subnet_cidr_block
  availability_zone    = var.primary_availability_zone
  public_subnet_enable = true
  tags                 = var.primary_subnet_tags
}

module "Routing_Tables" {
  source = "./modules/Route Tables"
  vpc_id = module.vpc.vpc_id
  routes = var.Public_routes
  gateway_id = module.vpc.vpc_id
}

module "Routing_Tables_Association" {
  source    = "./modules/Routing Tables Association"
  subnet_id = module.public_subnet.subnet_id
  rt_id     = module.Routing_Tables.route_table_id
}

module "security_group" {
  source          = "./modules/Security Group"
  vpc_id          = module.vpc.vpc_id
  sg_ingress_rule = var.custom_sg_ingress_rule
  sg_egress_rule  = var.custom_sg_egress_rule
  tags            = var.primary__sg_tags
}

module "ec2_instance" {
  source          = "./modules/EC2"
  subnet_id       = module.public_subnet.subnet_id
  security_groups = [module.security_group.security_group_id]
  instance_ami    = var.primary_instance_ami
  instance_type   = var.primary_instance_type
  tags            = var.primary_instance_tags
}