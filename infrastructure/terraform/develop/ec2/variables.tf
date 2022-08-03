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
  default     = "develop-kube-worker"
}

variable "vpc" {
  description = "Created VPC by module"
  type = any
}

variable "sg_pub_id" {
  description = "Public security group in VPC module"
  type = any
}

variable "sg_priv_id" {
  description = "Privet security group in VPC module"
  type = any
}