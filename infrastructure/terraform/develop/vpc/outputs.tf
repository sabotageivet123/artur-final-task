output "vpc" {
  value = module.vpc
}

output "sg_pub_id" {
  value = aws_security_group.allow_rules_pub.id
}

output "sg_priv_id" {
  value = aws_security_group.allow_rules_priv.id
}