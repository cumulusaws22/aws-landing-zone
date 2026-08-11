
################################################################
# Region Restriction SCPs
################################################################



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
