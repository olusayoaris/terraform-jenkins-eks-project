terraform {
  backend "s3" {
    bucket = "terraformprojectbucket"
    key    = "terraform/backend/eks/terraform.tfstate"
    region = "us-east-1"
  }
}
