output "public_connection_string" {
  description = "SSH connect to kubernetes master"
  value       = "ssh -i \"~/.ssh/final-test.pem\" ubuntu@${module.ec2.kube_master_public_ip}"
}
