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

variable "tag_policy_target_id" {
  description = "AWS Organizations target ID where the tag policy will be attached"
  type        = string
}

variable "tag_policy_name" {
  description = "Name of the mandatory tag policy"
  type        = string
  default     = "Enterprise-Mandatory-Tags"
}


#------------------------------

  #tags = {
    #Application = "payment"
    #Environment = "prod"
    #Owner       = "cloud-ops"
    #CostCenter  = "CC1001"
  #}