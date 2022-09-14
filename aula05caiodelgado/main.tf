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
  region                  = var.aws_region
  shared_credentials_file = var.aws_shared_credentials_file
  profile                 = var.aws_profile

}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"]
}


resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  tags          = var.instance_tags
  key_name = "notebook"

  lifecycle {
    create_before_destroy = true
    ignore_changes = [

    ]
  }

}

# criando Elastic IP
resource "aws_eip" "elasticip" {
  instance = aws_instance.web.id
}