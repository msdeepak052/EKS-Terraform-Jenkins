terraform {
  backend "s3" {
    bucket = "terraformjenkinsdeepak2024"
    key    = "terraform/jenkins/eks/terraform.tfstate"
    region = "ap-south-1"

  }
}