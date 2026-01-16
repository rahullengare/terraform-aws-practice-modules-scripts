## Different way to create EC2 instances in AWS by the using Teraform
 provider "aws" {
   region = "us-east-1"
 }
 
#1st way to create
/*
resource "aws_instance" "my-instance" {
  ami = "ami-07ff62358b87c7116"
  instance_type = "t2.micro"
  count = 2
  subnet_id     = "subnet-05cddf281d2df1926"
  tags = {
    Name = "web-server-new1"
  }
}
*/


#2nd way to create
/*
resource "aws_instance" "my-instance" {
  ami = "ami-07ff62358b87c7116"
  instance_type = "t2.micro"
  count = 2
  subnet_id     = "subnet-05cddf281d2df1926"
  tags = {
    Name = "web-server-new1${count.index}"
  }
}
*/


#3rd way to create
/*
resource "aws_instance" "my-first-instance" {
  ami = "ami-07ff62358b87c7116"
  instance_type = "t2.micro"
  subnet_id     = "subnet-05cddf281d2df1926"
  tags = {
    Name = "web-server-new"
  }
}
resource "aws_instance" "my-second-instance" {
  ami = "ami-07ff62358b87c7116"
  instance_type = "t2.micro"
  subnet_id     = "subnet-05cddf281d2df1926"
  tags = {
    Name = "app-server"
  }
}
*/


#4th way to create
/*
resource "aws_instance" "my-instance" {
  ami = "ami-07ff62358b87c7116"
  instance_type = "t2.micro"
  count = 2
  subnet_id     = "subnet-05cddf281d2df1926"
  tags = {
    Name = "web-server-new1${count.index+1}"
  }
}
*/


#5th way to create
resource "aws_instance" "three-instance" {
  ami = "ami-07ff62358b87c7116"
  for_each = toset(["app-server", "db-server", "proxy-server"])
  instance_type = "t2.micro"
  subnet_id     = "subnet-05cddf281d2df1926"
  tags = {
    Name = each.key
  }
}
