terraform {
  cloud {
    organization = "sabotage-ivet"
    workspaces {
      name = "develop"
    }
  }


  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_instance" "kube-master" {
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t3.small"
  key_name      = "final-test"

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

  tags = {
    Name = "${var.instance_worker_name}${count.index}"
    Purpose = "${var.purpose_worker}web"
    created_at = timestamp()
  }
}

