terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source = "hashicorp/aws"
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
}

output "coolify" {
  value = module.coolify.output
}