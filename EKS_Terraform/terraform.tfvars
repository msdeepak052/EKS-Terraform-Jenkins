vpc_name   = "EKS-Deepak-vpc"
name       = "EKS-Deepak-vpc"
cidr_block = "192.168.0.0/16"

public_subnet_cidrs  = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
private_subnet_cidrs = ["192.168.4.0/24", "192.168.5.0/24", "192.168.6.0/24"]
