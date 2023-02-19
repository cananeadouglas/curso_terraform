terraform {
  required_version = "1.3.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.39.0"
    }
  }
}

provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = ["~/.aws/credentials"]
}

resource "aws_lightsail_key_pair" "example" {
  name       = "key_pair"
  public_key = file("~/.ssh/id_rsa.pub")
}

# Crie uma instância do LightSail com o blueprint do WordPress
resource "aws_lightsail_instance" "example" {
  name              = "my-instance"
  availability_zone = "us-east-1b"
  blueprint_id      = "wordpress"
  bundle_id         = "nano_2_0"
  key_pair_name     = "key_pair"
  tags = {
    foo = "bar"
  }
}

# Crie um recurso de IP estático e associe-o à instância
resource "aws_lightsail_static_ip" "example" {
  name = "wordpress-static-ip"
}

resource "aws_lightsail_static_ip_attachment" "example" {
  static_ip_name = aws_lightsail_static_ip.example.name
  instance_name  = aws_lightsail_instance.example.name
}

# Crie uma regra de segurança para permitir conexões HTTP e HTTPS
resource "aws_lightsail_instance_public_ports" "example" {
  instance_name = aws_lightsail_instance.example.name

  port_info {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
  }

  port_info {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
  }

  port_info {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
  }
}

# Imprima o endereço IP da instância do LightSail
output "ip_address" {
  value = aws_lightsail_static_ip.example.ip_address
}