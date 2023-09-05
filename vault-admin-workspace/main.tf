# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "aws" {
  region = var.region
}

provider "vault" {}

resource "aws_iam_user" "secrets_engine" {
  name = "${var.project_name}-user"
}

resource "aws_iam_access_key" "secrets_engine_credentials" {
  user = aws_iam_user.secrets_engine.name
}

resource "aws_iam_user_policy" "secrets_engine" {
  user = aws_iam_user.secrets_engine.name

  policy = jsonencode({
    Statement = [
      {
        Action = [
          "iam:*"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
    Version = "2012-10-17"
  })
}

resource "vault_aws_secret_backend" "aws" {
  region = var.region
  path   = "${var.project_name}-path"

  access_key = aws_iam_access_key.secrets_engine_credentials.id
  secret_key = aws_iam_access_key.secrets_engine_credentials.secret

  default_lease_ttl_seconds = "120"
}

resource "vault_aws_secret_backend_role" "admin" {
  backend         = vault_aws_secret_backend.aws.path
  name            = "${var.project_name}-role"
  credential_type = "iam_user"

  policy_document = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "iam:*", "ec2:*"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}
