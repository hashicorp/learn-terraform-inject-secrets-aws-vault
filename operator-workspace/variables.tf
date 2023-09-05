# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "project_name" {
  type        = string
  description = "Name of the example project."

  default     = "dynamic-aws-creds-operator"
}

variable "region" {
  type        = string
  description = "AWS region for all resources."

  default = "us-east-1"
}

variable "vault_state_path" {
  type        = string
  description = "Path to state file of vault admin workspace."

  default     = "../vault-admin-workspace/terraform.tfstate"
}

variable "ttl" {
  type        = string
  description = "Value for TTL tag."

  default     = "1"
}
