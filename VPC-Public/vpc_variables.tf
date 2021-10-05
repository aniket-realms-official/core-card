variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
  type        = string
}

variable "vpc_instance_tenancy" {
  description = ""
  type        = string
  default     = "default"
}

variable "vpc_name" {}

variable "public_cidrs1" {
  type = list(string)
}

variable "public_cidrs2" {
  type = list(string)
}

variable "public_subnet1_name" {}
variable "public_subnet2_name" {}

variable "sg_name1" {}
variable "sg_name2" {}
variable "gateway_id" {}
