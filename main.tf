terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.89.0"
    }
  }
}

//create VPC

resource "aws_vpc" "sre-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "sre-vpc"
  }
}

//create subnet1
resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.sre-vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch =true

  tags = {
    Name = "public-subnet"
  }
}

//create subnet2
resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.sre-vpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "private-subnet"
  }
}

//create ec2 instance
resource "aws_instance" "server-1" {
  ami           = "ami-0d682f26195e9ec0f" # ap-south-1, ubuntu AMI
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public-subnet.id

    tags = {
    Name = "server-1"
  }
}


