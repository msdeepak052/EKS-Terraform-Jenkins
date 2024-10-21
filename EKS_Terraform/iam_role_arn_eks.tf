# Create an IAM policy for EKS admin access
resource "aws_iam_policy" "eks_admin_policy" {
  name        = "EKSAdminPolicy"
  description = "Policy for EKS Admin access"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = "*"
        Resource = "*"
      }
    ]
  })
}

# Create a role for EKS
resource "aws_iam_role" "eks_role" {
  name               = "EKSClusterRole"
  assume_role_policy = data.aws_iam_policy_document.eks_assume_role_policy.json
}

# Assume role policy document for EKS
data "aws_iam_policy_document" "eks_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }
  }
}

# Attach the necessary policies to the IAM role
resource "aws_iam_role_policy_attachment" "eks_admin_attachment" {
  policy_arn = aws_iam_policy.eks_admin_policy.arn
  role       = aws_iam_role.eks_role.name
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_role.name
}

resource "aws_iam_role_policy_attachment" "eks_worker_node_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks_role.name
}

resource "aws_iam_role_policy_attachment" "eks_ecs_container_registry_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks_role.name
}

# Create IAM user for Deepak
resource "aws_iam_user" "deepak_user" {
  name = "Deepak-EKS"
}

# Attach IAM Policy to Deepak
resource "aws_iam_user_policy_attachment" "attach_policy" {
  user       = aws_iam_user.deepak_user.name
  policy_arn = aws_iam_policy.eks_admin_policy.arn
}
# Create a login profile for Deepak to allow console access
resource "aws_iam_user_login_profile" "deepak_login_profile" {
  user                 = aws_iam_user.deepak_user.name
}