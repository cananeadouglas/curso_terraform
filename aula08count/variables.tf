variable "aws_region" {
  type        = string
  description = "Região Brasil"
  default     = "us-east-1"
}

variable "aws_shared_credentials_file" {
  type        = string
  description = ""
  default     = "/home/terraform_doug/.aws/credentials"
}

variable "aws_profile" {
  type        = string
  description = "perfil padrão"
  default     = "default"
}

variable "instance_type" {
  type        = string
  description = "configuração"
  default     = "t2.micro"
}

variable "instance_tags" {

  type        = map(string)
  description = "Informações Pessoais"
  default = {
    Name        = "myinstance-"
    Environment = "Dev"
    ManagedBy   = "Terraform" # quem vai gerenciar é o terraform
    Owner       = "Douglas Cananéa"
    UpdatedAt   = "2022-10-05 / 19:58"
    Project     = "Estudando Terraform aos sábados e Feriados"
  }
}