data "cloudinit_config" "server_config" {
  gzip          = true
  base64_encode = true
  part {
    content_type = "text/cloud-config"
    content      = templatefile("${path.module}/server.yml.tpl", var.root_user)
  }
}

data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "coolify" {
  ami                         = data.aws_ami.amazon_linux_2023.id
  instance_type               = "t2.micro"
  user_data                   = data.cloudinit_config.server_config.rendered
  user_data_replace_on_change = true

  key_name               = data.aws_key_pair.coolify_key.key_name
  vpc_security_group_ids = [aws_security_group.coolify_sg.id]
  
  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  volume_tags = local.tags
  tags = local.tags

  depends_on = [aws_security_group.coolify_sg]
}

resource "aws_eip" "coolify_eip" {
  instance = aws_instance.coolify.id
  tags = local.tags
}
