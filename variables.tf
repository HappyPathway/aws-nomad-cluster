variable "key_name" {}

variable "consul_cluster" {}

variable "vault_cluster" {}

variable "vault_token" {}

variable "organization" {}

variable "network_ws" {}

variable "servers" {
  default = 3
}

variable "clients" {
  default = 3
}
