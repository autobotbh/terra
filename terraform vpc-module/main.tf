module "vpc" {
    source = "./modules/vpc"
    vpc_cidr_block = var.vpc_cidr_block
    subnet_cidr_block = var.subnet_cidr_block
    
}

module "security_group" {
    source = "./modules/sg"
    vpc_id = module.vpc.vpc_id
    
}

module "ec2" {
    source = "./modules/ec2"
    sg_id = module.security_group.sg_id
    subnets = module.vpc.subnets_id
  
}

module "alb" {
    source = "./modules/alb"
    sg_id = module.security_group.sg_id
    subnets = module.vpc.subnets_id
    vpc_id = module.vpc.vpc_id
    instance = module.ec2.instance
    }