resource "aws_security_group" "photo_security" {
  name        = "Photo-Security"
  description = "launch-wizard-3 created 2025-12-30T01:39:29.459Z"
  vpc_id      = aws_vpc.main.id

  tags = {
    Environment = "dev"
    ManagedBy   = "terraform"
    Owner       = "jitesh"
    Project     = "aws-devops-photography"
  }
}
