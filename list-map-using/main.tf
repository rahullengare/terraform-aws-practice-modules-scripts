provider "aws" {
  region = "us-east-1"
}

# List example
variable "instance_names" {
  default = ["app-server", "db-server", "proxy-server"]
}

resource "aws_instance" "multiple" {
  ami           = "ami-07ff62358b87c7116"
  for_each      = toset(var.instance_names)
  instance_type = "t2.micro"

  tags = {
    Name = each.key
  }
}
