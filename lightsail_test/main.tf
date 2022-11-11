terraform {
  required_version = "1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.23.0"
    }
  }
}

provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "$HOME/.aws/credentials"
}

resource "aws_lightsail_key_pair" "lg_key_pair" {
  name       = "importing"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_lightsail_static_ip_attachment" "test" {
  static_ip_name = aws_lightsail_static_ip.test.id
  instance_name  = aws_lightsail_instance.test.id
}

resource "aws_lightsail_static_ip" "test" {
  name = "example"
}

resource "aws_lightsail_instance" "test" {
  name              = "minha_maquina_aws"
  availability_zone = "us-east-1b"
  blueprint_id      = "wordpress"
  bundle_id         = "nano_2_0"
  key_pair_name     = "Wordpress-KP"
  tags = {
    foo = "bar"
  }
}

output "instance_ip" {
  value = aws_lightsail_static_ip.test.ip_address
}