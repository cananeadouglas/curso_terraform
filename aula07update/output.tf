output "elastic_IP" {
  value = aws_eip.elasticip.public_ip
}