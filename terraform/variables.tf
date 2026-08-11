variable "aws_region" {
  description = "AWS region for the Organizations API"
  type        = string
  default     = "ap-south-1"
}

variable "scp_name_prefix" {
  description = "Prefix for SCP names"
  type        = string
  default     = "CT-Governance"
}