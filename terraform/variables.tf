variable "aws_region" {
  description = "AWS region for the Organizations API"
  type        = string
}

variable "scp_name_prefix" {
  description = "Prefix for SCP names"
  type        = string
  default     = "CT-Governance"
}

variable "non-prod_ou_id" {
  description = "AWS region for the Organizations API"
  type        = string
}

variable "tag_policy_name" {
  description = "Name of the mandatory tag policy"
  type        = string
}


variable "sso_instance_arn" {
  description = "IAM Identity Center instance ARN"
  type        = string
}

variable "identity_center_group_id" {
  description = "IAM Identity Center group ID"
  type        = string
}

variable "target_accounts" {
  description = "AWS accounts to which the CloudOps permission set should be assigned"
  type = map(object({
    account_id = string
    account_name = string
  }))
}