provider "aws" {
  region = "us-east-1"
}

# Data block to fetch existing VPC
data "aws_vpc" "default" {
  default = true
}

output "vpc_id" {
  value = data.aws_vpc.default.id
}
