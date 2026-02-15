provider "aws" {
  region = "us-east-1"
}

# Fetch existing Security Group
data "aws_security_group" "existing_sg" {
  id = "sg-xxxxxxxx"
}

output "security_group_name" {
  value = data.aws_security_group.existing_sg.name
}
