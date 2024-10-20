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
