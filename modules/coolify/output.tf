output "output" {
  value = {
    ami      = data.aws_ami.amazon_linux_2023.id
    instance = aws_instance.coolify.arn
    eip      = aws_eip.coolify_eip.public_ip
  }
}