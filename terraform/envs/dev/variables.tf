variable "project" {
  description = "Project name"
  type        = string
  default     = "aws-devops-photography-project"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "common_tags" {
  description = "Common tags"
  type        = map(string)
  default = {
    Project     = "aws-devops-photography-project"
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}
