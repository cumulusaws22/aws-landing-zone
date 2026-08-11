terraform {
  backend "s3" {
    bucket  = "terraform-state-200845569305-us-east-1"
    key     = "dev/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }

    backend "s3" {
    bucket  = "terraform-state-200845569305-us-east-2"
    key     = "uat/terraform.tfstate"
    region  = "us-east-2"
    encrypt = true
  }
}