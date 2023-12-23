terraform {
  backend "s3" {
    bucket = "jendareyprojectbucketone"
    key    = "terraform/backend/jenkins-server/terraform.tfstate"
    region = "us-east-1"
  }
}
