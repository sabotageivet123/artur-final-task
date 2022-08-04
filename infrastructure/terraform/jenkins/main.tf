terraform {
  cloud {
    organization = "sabotage-ivet"
    workspaces {
      name = "jenkins"
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

data "aws_subnet" "selected" {
  filter {
    name   = "tag:Name"
    values = ["develop-vpc-public-*-*a"]
  }
}

resource "aws_instance" "jenkins" {
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t3.micro"
  key_name      = "final-test"
  subnet_id = "${data.aws_subnet.selected.id}"

  tags = {
    Name = var.instance_name
    Purpose = var.purpose
    created_at = timestamp()
  }
}