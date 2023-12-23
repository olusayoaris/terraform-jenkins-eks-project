terraform {
  backend "s3" {
    bucket = "jendareyprojectbucket"
    key    = "terraform/backend/jenkins-server/terraform.tfstate"
    region = "us-east-1"
  }
}
