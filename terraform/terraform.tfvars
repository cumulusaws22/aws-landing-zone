aws_region = "us-east-1"

non-prod_ou_id = "ou-slmb-ytdz020q"

tag_policy_name = "Enterprise-Mandatory-Tags"


sso_instance_arn = "arn:aws:sso:::instance/ssoins-722329fd3c00af48"

identity_center_group_id = "e458c4b8-f051-7062-d2ed-ea0d495ef700"

target_accounts = {
  dev = {
    account_id   = "200845569305"
    account_name = "cumulus.aws.control2026"
  }

  test = {
    account_id   = "568339496407"
    account_name = "cumulus.aws2026"
  }
}