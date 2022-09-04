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
resource "aws_s3_bucket" "meu-primeiro-terraform" {
  bucket = "my-tf-test-bucket-soletras-minusculas-765" # só podem letras minusculas e números
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    ManagedBy   = "Terraform" # quem vai gerenciar é o terraform
    Owner       = "Douglas Cananea"
    UpdatedAt   = "2022-08-28"
  }
}
resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.meu-primeiro-terraform.id
  acl    = "private"
}
