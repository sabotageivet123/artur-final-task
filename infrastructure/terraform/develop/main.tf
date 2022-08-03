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

module "vpc" {
  source    = "./vpc"
  namespace = var.namespace
}

module "ec2" {
  source     = "./ec2"
  vpc        = module.vpc.vpc
  sg_pub_id  = module.vpc.sg_pub_id
  sg_priv_id = module.vpc.sg_priv_id
}