resource "aws_ssoadmin_permission_set" "cloudops" {
  name             = "AWS-CloudOps"
  instance_arn     = var.sso_instance_arn
  session_duration = "PT8H"
}


resource "aws_ssoadmin_managed_policy_attachment" "cloudops" {
  instance_arn       = var.sso_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.cloudops.arn

  managed_policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}