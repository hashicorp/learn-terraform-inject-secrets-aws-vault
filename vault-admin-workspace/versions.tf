terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.26.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "2.18.0"
    }
  }
}
