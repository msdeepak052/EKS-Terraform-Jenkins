# VPC
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "EKS-vpc"
  cidr = var.cidr_block

  azs = data.aws_availability_zones.azn.names

  private_subnets = var.private_subnet_cidrs
  public_subnets  = var.public_subnet_cidrs

  enable_dns_hostnames = true
  enable_nat_gateway   = true
  single_nat_gateway   = true

  tags = {
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
    "kubernetes.io/role/elb"               = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
    "kubernetes.io/role/internal-elb"      = 1
  }

}

# EKS

module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name    = "deepak-eks-cluster"
  cluster_version = "1.24"

  cluster_endpoint_public_access = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    nodes = {
      min_size     = 2
      max_size     = 3
      desired_size = 2

      instance_types = ["t2.micro"]
    }
  }

  tags = {
    Environment = "EKS-Deepak-Cluster"
    Terraform   = "true"
  }
}