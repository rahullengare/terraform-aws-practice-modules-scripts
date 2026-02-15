provider "aws" {
  region = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

resource "aws_instance" "variable_example" {
  ami           = "ami-07ff62358b87c7116"
  instance_type = var.instance_type

  tags = {
    Name = "Variable-Instance"
  }
}
