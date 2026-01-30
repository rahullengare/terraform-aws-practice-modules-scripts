provider "aws" {
  region = "us-east-1"
}

#This code automatically finds the latest Amazon Linux 2 AMI for the current region.
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# This creates the actual key pair (private and public)
resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# This sends the public part to AWS
resource "aws_key_pair" "generated_key" {
  key_name   = "my-terraform-keynew"
  public_key = tls_private_key.example.public_key_openssh
}

# This saves the private key to your local computer
resource "local_file" "ssh_key" {
  filename = "${path.module}/my-terraform-key.pem"
  content  = tls_private_key.example.private_key_pem
}

# Launch an EC2 Instance
resource "aws_instance" "web2" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t2.micro"
  subnet_id     = "subnet-05cddf281d2df1926" 
  key_name               = aws_key_pair.generated_key.id
  vpc_security_group_ids = ["sg-01ef9c631ea5c86d7"]

  tags = {
    Name = "my-server-new"
  }
}
