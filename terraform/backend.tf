terraform {
  backend "s3" {
    bucket = "jendareyprojectbucket"
    key    = "terraform/backend/eks/terraform.tfstate"
    region = "us-east-1"
  }
}
