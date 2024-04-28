output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "asg_name" {
  value = module.asg.asg_name
}

output "alb_security_group_id" {
  value = module.alb.alb_security_group_id
}
