terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.7.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "3.17.0"
    }
  }

  backend "local" {
    path = "terraform.tfstate"
  }
}
