terraform {
  backend "s3" {
    bucket = "solutionbaseprojectbucketone"
    key    = "terraform/backend/jenkins-server/terraform.tfstate"
    region = "us-east-1"
  }
}
