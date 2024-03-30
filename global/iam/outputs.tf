output "neo_cloundwatch_policy_arn" {
  value = var.give_neo_cloudwatch_full_access ? aws_iam_user_policy_attachment.neo_cloudwatch_full_access[0].policy_arn : aws_iam_user_policy_attachment.neo_cloudwatch_read_only_access[0].policy_arn
}

