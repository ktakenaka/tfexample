provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "s3" {
    bucket         = "terraform-up-and-running-bb1994"
    key            = "global/iam/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}

resource "aws_iam_role" "instance" {
  name_prefix        = "terraform-"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

data "aws_iam_policy_document" "ec2_admin_permission" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:*"]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "example" {
  role   = aws_iam_role.instance.id
  policy = data.aws_iam_policy_document.ec2_admin_permission.json
}

resource "aws_iam_openid_connect_provider" "github_actions" {
  url             = "https://token.actions.githubusercontent.com"
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.github.certificates[0].sha1_fingerprint]
}

data "tls_certificate" "github" {
  url = "https://token.actions.githubusercontent.com"
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    principals {
      identifiers = [aws_iam_openid_connect_provider.github_actions.arn]
      type        = "Federated"
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:sub"
      values = [
        for a in local.allowed_repos_branches : "repo:${a["org"]}/${a["repo"]}:ref:refs/heads/${a["branch"]}"
      ]
    }
  }
}
