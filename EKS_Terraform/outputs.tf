output "vpc_id" {
  value       = data.aws_vpc.selected_vpc.id
  description = "VPC ID of the created VPC"
}
# Output the CIDR blocks of private and public subnets
output "private_subnet_cidrs" {
  value = local.private_subnet_ids
  
  }