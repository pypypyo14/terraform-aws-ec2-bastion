variable "project" {
  default = "terraform_practice"
}

variable "key_name" {
  default = "id_rsa_saba"
}

variable "vpc_id" {
  description = "usually module.basic-networks.public_subnets_id[0]"
}
variable "subnet_id" {
  description = "usually module.basic-networks.public_subnets_id[0]"
}

variable "cidr_blocks" {
  default = ["0.0.0.0/0"]
}
