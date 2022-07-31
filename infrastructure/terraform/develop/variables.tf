variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "devops7-master-finaltask"
}

variable "purpose" {
  description = "Value of the Purpose tag for the EC2 instance"
  type        = string
  default     = "develop-kube-master"
}

variable "instance_worker_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "devops7-worker-finaltask"
}

variable "purpose_worker" {
  description = "Value of the Purpose tag for the EC2 instance"
  type        = string
  default     = "develop-kube-worker-"
}