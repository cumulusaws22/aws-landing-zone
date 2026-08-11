resource "aws_organizations_policy" "restrict_regions" {
  name        = "${var.scp_name_prefix}-Restrict-Regions"
  description = "Restrict AWS resource creation outside approved regions"
  type        = "SERVICE_CONTROL_POLICY"
  content     = file("${path.module}/../policies/restrict-regions.json")

  tags = {
    ManagedBy = "Terraform"
    Purpose   = "RegionRestriction"
  }
}

resource "aws_organizations_policy" "deny_public_s3" {
  name        = "${var.scp_name_prefix}-Deny-Public-S3"
  description = "Prevent disabling S3 Block Public Access"
  type        = "SERVICE_CONTROL_POLICY"
  content     = file("${path.module}/../policies/deny-public-s3.json")

  tags = {
    ManagedBy = "Terraform"
    Purpose   = "S3Security"
  }
}