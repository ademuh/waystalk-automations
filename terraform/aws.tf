# This is a sample file for aws
provider "aws" {
    version = "~> 2.0"
    region  = "us-east-1" # AWS region
}

resource "aws_vpc" "main" { 
  cidr_block = "10.5.0.0/16" # For Private IP assignment
  tags = {
      Name = "tuts vpc" # tags are optional
  }
}

resource "aws_subnet" "web" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.5.0.0/16" # For Private IP assignment
    tags = {
        Name = "web-subnet"
    }
}

resource "aws_instance" "foobar" {
    ami = "ami-09e67e426f25ce0d7" # Acquire from AWS console
    instance_type = "t2.micro" # Acquire from AWS console
    subnet_id = aws_subnet.web.id
    tags = {  # tags are optional
        Name = "example"
        foo  = "bar"
    }
}
