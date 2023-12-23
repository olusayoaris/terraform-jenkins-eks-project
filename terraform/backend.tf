terraform {
  backend "s3" {
    bucket = "jendareyprojectbucketone"
    key    = "terraform/backend/eks/terraform.tfstate"
    region = "us-east-1"
  }
}
