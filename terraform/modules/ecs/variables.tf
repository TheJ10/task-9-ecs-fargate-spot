variable "image_tag" {}
variable "ecr_repository_url" {
  type = string
}

variable "execution_role_arn" {}

variable "log_group_name" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "db_host" {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {}

