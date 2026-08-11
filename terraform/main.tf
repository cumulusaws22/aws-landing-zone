
################################################################
# Region Restriction SCPs
################################################################

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

resource "aws_organizations_policy_attachment" "restrict_regions_prod" {
  policy_id = aws_organizations_policy.restrict_regions.id
  target_id = var.non-prod_ou_id
}

##################################################################
# Restrict Public Access To S3
##################################################################

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

resource "aws_organizations_policy_attachment" "deny_public_s3_prod" {
  policy_id = aws_organizations_policy.deny_public_s3.id
  target_id = var.non-prod_ou_id
}

##################################################
# Region Restriction Guardrail
##################################################

resource "aws_controltower_control" "region_deny" {

  for_each = var.region_deny_ous

  control_identifier = "arn:aws:controltower:${var.control_tower_home_region}::control/CT.MULTISERVICE.PV.1"

  target_identifier = each.value

  parameters {
    key   = "AllowedRegions"
    value = join(",", var.allowed_regions)
  }
}