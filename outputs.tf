output "aws_instance_publicip" {
  value = aws_instance.web.public_ip
}

output "aws_instance_publicinstance" {
  value = aws_instance.web.public_dns
  
}
