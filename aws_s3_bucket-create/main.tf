provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-terraform-bucket-1234567"

  tags = {
    Name = "BeginnerBucket"
  }
}
