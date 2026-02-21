resource "aws_security_group" "wp_web_public_sg" {
  name        = "Photo-Security"
  description = "launch-wizard-3 created 2025-12-30T01:39:29.459Z"
  vpc_id      = "vpc-06081c8e6fe1703a7"

  ingress {
    description = "Allow HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["76.68.63.254/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
