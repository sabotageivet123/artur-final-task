
//TODO fix hardcoded AMI 
//TODO add more configurable points
resource "aws_instance" "kube-master" {
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t3.small"
  key_name      = "final-test"
  subnet_id                   = var.vpc.public_subnets[0]
  vpc_security_group_ids      = [var.sg_pub_id]

  tags = {
    Name = var.instance_name
    Purpose = var.purpose
    created_at = timestamp()
  }
}

resource "aws_instance" "kube-worker" {
  count         = 1
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t3.micro"
  key_name      = "final-test"
  associate_public_ip_address = false
  subnet_id                   = var.vpc.private_subnets[0]
  vpc_security_group_ids      = [var.sg_priv_id]

  tags = {
    Name = "${var.instance_worker_name}-${count.index}"
    Purpose = "${var.purpose_worker}-web"
    created_at = timestamp()
  }
}

