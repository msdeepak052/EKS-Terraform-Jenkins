# Calling the VPC module

module "vpc" {
  source               = "./modules/vpc"
  vpc_name             = var.vpc_name
  cidr_block           = var.cidr_block
  public_subnet_count  = var.public_subnet_count
  private_subnet_count = var.private_subnet_count
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = data.aws_availability_zones.azn.names
}

# Calling the Security Groups module

module "security_groups" {
  source = "terraform-aws-modules/security-group/aws"

  name        = var.sgname
  description = var.sgdescription
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = var.ingress_with_cidr_blocks
  egress_with_cidr_blocks  = var.egress_with_cidr_blocks

  tags = {
    Name = var.sgtagname
  }
}

#Creating the EC2 instance

module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = var.ec2instance_name

  instance_type               = var.ec2instance_instance_type
  key_name                    = var.ec2instance_key_name
  vpc_security_group_ids      = [module.security_groups.security_group_id]
  subnet_id                   = element(module.vpc.public_subnet_ids, 0)
  associate_public_ip_address = true
  user_data                   = file("jenkins-installation.sh")
  availability_zone           = element(data.aws_availability_zones.azn.names, 0)
  ami                         = var.ami_name

  tags = {
    Name = var.ec2instance_tagname
  }
}
