terraform {
  required_version = "0.14.11"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.23.0"
    }
  }
}

provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "/home/terraform_doug/.aws/credentials"
  profile                 = "default"

}

resource "aws_instance" "web" {
  ami               = "ami-01d025118d8e760db"
  instance_type     = "t2.micro"

  tags = {
    Name        = "My Instance"
    Environment = "Dev"
    ManagedBy   = "Terraform" # quem vai gerenciar é o terraform
    Owner       = "Douglas Cananéa"
    UpdatedAt   = "2022-09-04"
  }

  lifecycle {
    create_before_destroy = true
  }

}

