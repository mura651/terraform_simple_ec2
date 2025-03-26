variable "name_prefix" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "env" {
  type = string
}

variable "app_name" {
  type = string
  default = "null"
}

variable "subnet_id" {
  type = string
}

variable "key_name" {
  type = string
}