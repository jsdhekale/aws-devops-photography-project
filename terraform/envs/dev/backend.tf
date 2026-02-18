terraform {
  backend "s3" {
    bucket         = "jsdhekale-aws-devops-photography-tfstate"
    key            = "envs/dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks-aws-devops-photography"
    encrypt        = true
  }
}
