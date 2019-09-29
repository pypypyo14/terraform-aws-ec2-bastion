variable "project" {
  default = "terraform_practice"
}

variable "key_name" {
  default = "id_rsa_saba"
}

variable "subnet_id" {}

variable "cidr_blocks" {
  default = ["0.0.0.0/0"]
}
