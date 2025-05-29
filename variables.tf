variable "aws_region" {
  type    = string
  default = "eu-central-1"
}
variable "domain" {
  type        = string
  description = "Main Domain use for project"
}

variable "root_user" {
  type = object({
    username = string
    email = string
    password = string
  })
}