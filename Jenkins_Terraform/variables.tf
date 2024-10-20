#variables dor S3 Backend

variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
}
# Variables for VPC
variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string

}

variable "name" {
  description = "Name of the VPC"
  type        = string
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_count" {
  description = "Number of private subnets"
  type        = number
}

variable "public_subnet_count" {
  description = "Number of public subnets"
  type        = number
}
# -----------------------------------------------------------------------------
# --------------- Security Groups  --------------------------------------------

variable "sgname" {
  description = "Name of the SG"
  type        = string
}

variable "sgdescription" {
  description = "Description of the SG"
  type        = string
}

variable "ingress_with_cidr_blocks" {
  description = "List of ingress rules with CIDR blocks"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
    cidr_blocks = string
  }))
}

variable "egress_with_cidr_blocks" {
  description = "List of egress rules with CIDR blocks"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
    cidr_blocks = string
  }))
}

variable "sgtagname" {
  description = "Tag Name of the SG"
  type        = string
}

# -----------------------------------------------------------------------------
# ---------------    EC2 - Instance  ------------------------------------------


variable "ec2instance_name" {
  description = "ec2instance Name of the SG"
  type        = string
}

variable "ec2instance_instance_type" {
  description = "Taec2instance_instance_type Name of the SG"
  type        = string
}

variable "ec2instance_key_name" {
  description = "ec2instance_key_name Name of the SG"
  type        = string
}


variable "ec2instance_tagname" {
  description = "ec2instance_tagname Name of the SG"
  type        = string
}
variable "ami_name" {
  description = "ami Name of the SG"
  type        = string
}





