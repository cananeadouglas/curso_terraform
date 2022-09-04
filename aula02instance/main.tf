terraform {
  required_version = "0.14.11"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.28.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" #EUA "eu-central-1"
}

resource "aws_instance" "web" {
  ami           = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
    Owner       = "Douglas Cananéa"
    UpdatedAt   = "2022-09-03"
  }
}