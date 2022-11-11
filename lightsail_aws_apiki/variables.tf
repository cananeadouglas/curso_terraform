variable "region" {
  type    = string
  default = "us-east-1"
}

variable "aws_shared_credentials_file" {
  type        = string
  description = ""
  default     = "$HOME/.aws/credentials"
}

variable "instance_availability_zone" {
  type    = string
  default = "us-east-1b"
}

# Name Instance
variable "instance" {
  type    = string
  default = "wordpress"
}

variable "instance_blueprintid" {
  type    = string
  default = "wordpress"
}

variable "instance_bundleid" {
  type    = string
  default = "nano_2_0"
}

variable "intance_key_pair" {
  type    = string
  default = "Wordpress-KP"
}

variable "static_ip" {
  type    = string
  default = "Wordpress-IP"
}

variable "static_ip_attachment" {
  type    = string
  default = "Wordpress-IP"
}