vpc_name   = "deepak-vpc"
name       = "deepak-vpc"
cidr_block = "10.0.0.0/16"

public_subnet_count  = 2
private_subnet_count = 2
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]

ingress_with_cidr_blocks = [
  {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    description = "http"
    cidr_blocks = "0.0.0.0/0"
  },
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "ssh"
    cidr_blocks = "0.0.0.0/0"
  }
]

egress_with_cidr_blocks = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    description = "All_Traffic"
    cidr_blocks = "0.0.0.0/0"
  }
]

sgname        = "Jenkins-SG"
sgdescription = "SG for Jenkins"
sgtagname     = "Jenkins-SG"


ec2instance_name          = "Jenkins EC2"
ec2instance_instance_type = "t2.medium"
ec2instance_key_name      = "deepak"
ec2instance_tagname       = "Jenkins-Server"
ami_name                  = "ami-022ce6f32988af5fa"
