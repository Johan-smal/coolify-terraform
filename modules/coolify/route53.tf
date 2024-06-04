data "aws_route53_zone" "main_zone" {
  name = var.domain
}

resource "aws_route53_record" "web_server_record" {
  zone_id = data.aws_route53_zone.main_zone.zone_id
  name    = "*.${var.domain}"  # Subdomain for your web server
  type    = "A"
  ttl     = 300  # Time to Live for the record (in seconds)

  # Use the public IP of the EIP
  records = [aws_eip.coolify_eip.public_ip]
}