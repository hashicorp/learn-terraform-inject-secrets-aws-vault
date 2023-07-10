# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "project_name" {
  type        = string
  description = "Name of this project."

  default     = "dynamic-aws-creds-vault"
}

variable "region" {
  type        = string
  description = "AWS region for all resources."

  default = "us-east-1"
}
