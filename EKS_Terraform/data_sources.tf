# Fetch the latest Amazon Linux 2 AMI
data "aws_ami" "redhat_linux" {
  most_recent = true
  owners      = ["309956199498"] # Owner ID for Red Hat

  filter {
    name   = "image-id"
    values = ["ami-022ce6f32988af5fa"] # Replace with the actual AMI ID
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


data "aws_availability_zones" "azn" {

}

data "aws_vpc" "selected_vpc" {
  filter {
    name   = "tag:Name"     # Replace with your tag key
    values = ["deepak-vpc"] # Replace with your tag value
  }
}

# Fetch all subnets in the existing VPC
data "aws_subnets" "all_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected_vpc.id]
  }
}

# Fetch details for each subnet to obtain CIDR blocks and tags
data "aws_subnet" "subnets" {
  for_each = toset(data.aws_subnets.all_subnets.ids)

  id = each.key
}


# Local variables to filter private and public subnets based on tags
locals {
  # Fetching subnet IDs for each subnet based on their tags
  private_subnet_ids = [for subnet in data.aws_subnet.subnets : subnet.id if subnet.tags["Type"] == "private"]
}