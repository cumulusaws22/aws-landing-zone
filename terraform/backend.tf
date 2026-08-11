terraform {
  backend "s3" {
    bucket  = "terraform-state-200845569305-us-east-1"
    key     = "backend/terraform-state.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}