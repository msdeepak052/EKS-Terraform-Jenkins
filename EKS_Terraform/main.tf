# EKS

module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name    = "deepak-eks-cluster"
  cluster_version = "1.24"

  vpc_id     = data.aws_vpc.selected_vpc.id
  subnet_ids = local.private_subnet_ids  # Use fetched private subnet IDs

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }
  enable_irsa = true
  # Associate the IAM role for the EKS cluster
  iam_role_arn = aws_iam_role.eks_role.arn

  eks_managed_node_groups = {
    nodes = {
      min_size     = 2
      max_size     = 3
      desired_size = 2

      instance_types = ["t2.micro"]
      aws_ami="ami-022ce6f32988af5fa"
    }
  }

  tags = {
    Environment = "EKS-Deepak-Cluster"
    Terraform   = "true"
  }
}