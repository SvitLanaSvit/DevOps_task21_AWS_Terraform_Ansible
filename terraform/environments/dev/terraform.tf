terraform {
  required_version = "~>1.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }

    http = {
      source  = "hashicorp/http"
      version = "~> 3.4"
    }
  }
  backend "s3" {
    bucket               = "terraform-state-danit10-devops"
    region               = "eu-central-1"
    workspace_key_prefix = "sk-terraform"
    key          = "sk-dev.tfstate"
    use_lockfile = true
  }
}
provider "aws" {
  region = var.aws_region
}
