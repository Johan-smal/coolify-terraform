output "output" {
  value = {
    ami      = data.aws_ami.amazon_linux_2023
    instance = aws_instance.coolify
    eip      = aws_eip.coolify_eip
  }
}