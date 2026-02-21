resource "aws_s3_bucket" "terraform_test_bucket" {
  bucket = "jit-terraform-test-bucket-001"

  tags = {
    Name        = "terraform-test"
    Environment = "dev"
  }
}
