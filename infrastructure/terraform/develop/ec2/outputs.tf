output "kube_master_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.kube-master.id
}

output "kube_master_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.kube-master.public_ip
}

output "kube_worker_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.kube-worker.*.id
}

output "kube_worker_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.kube-worker.*.public_ip
}
