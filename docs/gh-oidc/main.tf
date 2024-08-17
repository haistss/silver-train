locals {
  create_oidc_provider = var.oidc_provider_arn == ""
}

resource "aws_iam_role" "role" {
  assume_role_policy = jsonencode({
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRoleWithWebIdentity"
        Principal = {
          Federated = local.create_oidc_provider ? aws_iam_openid_connect_provider.github_oidc[0].arn : var.oidc_provider_arn
        }
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud" = var.oidc_audience
          }
          StringLike = {
            "token.actions.githubusercontent.com:sub" = "repo:${var.github_org}/${var.repository_name}:*"
          }
        }
      }
    ]
  })
}

resource "aws_iam_openid_connect_provider" "github_oidc" {
  count           = local.create_oidc_provider ? 1 : 0
  url             = "https://token.actions.githubusercontent.com"
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = ["ffffffffffffffffffffffffffffffffffffffff"]
}

output "role_arn" {
  value = aws_iam_role.role.arn
}
