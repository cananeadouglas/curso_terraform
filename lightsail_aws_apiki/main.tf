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
  region                  = var.region
  shared_credentials_file = var.aws_shared_credentials_file
}

# static IP
resource "aws_lightsail_static_ip_attachment" "static_ip_attachment" {
  instance_name  = aws_lightsail_instance.instance.name
  static_ip_name = var.static_ip_attachment
}

resource "aws_lightsail_static_ip" "static_ip" {
  name = var.static_ip
}

# SSH Key Pair
resource "aws_lightsail_key_pair" "intance_key_pair" {
  name = "importing"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

# Wordpress
resource "aws_lightsail_instance" "instance" {
  name              = var.instance
  availability_zone = var.instance_availability_zone
  blueprint_id      = var.instance_blueprintid
  bundle_id         = var.instance_bundleid
  key_pair_name     = var.intance_key_pair
  tags = {
    Environment = "Desafio D.O."
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = [

    ]
  }
}