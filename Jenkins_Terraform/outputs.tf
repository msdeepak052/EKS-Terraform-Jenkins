output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "VPC ID of the created VPC"
}

# output "eks_cluster_endpoint" {
#   value       = aws_eks_cluster.cluster.endpoint
#   description = "Endpoint for the EKS cluster"
# }

# output "worker_ami_id" {
#   value       = data.aws_ami.amazon_linux_2.id
#   description = "The ID of the Amazon Linux 2 AMI"
# }
