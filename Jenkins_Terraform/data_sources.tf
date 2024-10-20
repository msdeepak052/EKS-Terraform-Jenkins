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
