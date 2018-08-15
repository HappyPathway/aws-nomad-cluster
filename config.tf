variable "owner" {}
variable "ttl" {}
variable "cluster_name" {}

locals {
  resource_tags = {
    Owner       = "${var.owner}"
    TTL         = "${var.ttl}"
    ClusterName = "${var.cluster_name}"
  }
}

//--------------------------------------------------------------------
data "terraform_remote_state" "network" {
  backend = "atlas"

  config {
    name = "${var.organization}/${var.network_ws}"
  }
}

data "terraform_remote_state" "consul_cluster" {
  backend = "atlas"

  config {
    name = "${var.organization}/${var.consul_cluster}"
  }
}

data "terraform_remote_state" "vault_cluster" {
  backend = "atlas"

  config {
    name = "${var.organization}/${var.vault_cluster}"
  }
}
