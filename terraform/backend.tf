terraform {
  backend "s3" {
    bucket = "solutionbaseprojectbucketone"
    key    = "terraform/backend/eks/terraform.tfstate"
    region = "us-east-1"
  }
}
