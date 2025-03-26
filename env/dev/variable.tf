variable "cidr_block" {
  type        = string
  description = "VPC CIDR block"
}

variable "app_name" {
  type = string
}

variable "env" {
  type = string
}

variable "public_subnet_cidr" {
  type        = string
  description = "Public subnet CIDR block"
}

variable "availability_zone" {
  type        = string
  description = "AZ for the subnet"
}

variable "key_name" {
  type = string
}