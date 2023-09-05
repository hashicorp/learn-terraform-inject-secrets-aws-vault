# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "backend" {
  value = vault_aws_secret_backend.aws.path
}

output "role" {
  value = vault_aws_secret_backend_role.admin.name
}
