

################################################################
# Tag Policy
################################################################

data "aws_organizations_organization" "current" {}

resource "aws_organizations_policy" "mandatory_tags" {
  name        = var.tag_policy_name
  description = "Enterprise mandatory tagging policy"
  type        = "TAG_POLICY"

  content = file("${path.module}/../policies/mandatory-tags.json")
}

resource "aws_organizations_policy_attachment" "mandatory_tags" {
  policy_id = aws_organizations_policy.mandatory_tags.id
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
