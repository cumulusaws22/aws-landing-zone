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
  description = "OU ARNs where Region Deny should be enabled"
  type        = map(string)

  default = {
    #uat        = "arn:aws:organizations::123456789012:ou/o-example/ou-prod"
    nonprod    = "arn:aws:organizations::200845569305:ou/o-yzrg6g6dd8/ou-slmb-ytdz020q"
  }
}

variable "allowed_regions" {
  description = "AWS Regions allowed for workloads"
  type        = list(string)

  default = [
    "us-east-1",
    "us-east-2"
  ]
}