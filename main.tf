terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.3"
    }
  }

  backend "local" {
    path = "./terraform/terraform.tfstate"
  }
}

provider "aws" {
  region = var.aws_region
}

module "coolify" {
  source = "./modules/coolify"
  domain = var.domain
  root_user = var.root_user
}

output "coolify" {
  value = module.coolify.output
}