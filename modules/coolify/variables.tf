variable "aws_key_name" {
  type    = string
  default = "coolify"
}

variable "domain" {
  type = string
}

variable "root_user" {
  type = object({
    username = string
    email = string
    password = string
  })
}