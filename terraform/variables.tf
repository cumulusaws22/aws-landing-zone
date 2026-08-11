variable "aws_region" {
  description = "AWS region for the Organizations API"
  type        = string
  default     = "us-east-1"
}

variable "scp_name_prefix" {
  description = "Prefix for SCP names"
  type        = string
  default     = "CT-Governance"
}

variable "non-prod_ou_id" {
  description = "AWS region for the Organizations API"
  type        = string
  default     = "ou-slmb-ytdz020q"
}

variable "region_deny_ous" {
  type = map(string)
}
variable "allowed_regions" {
  type = list(string)
}
variable "control_tower_home_region" {
  type = string
}