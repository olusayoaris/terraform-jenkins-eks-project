terraform {
  backend "s3" {
    bucket = "terraformprojectbucket"
    key    = "terraform/backend/jenkins-server/terraform.tfstate"
    region = "us-east-1"
  }
}
