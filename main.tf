//--------------------------------------------------------------------
// Variables

provider "aws" {
  region = "${data.terraform_remote_state.network.region}"
}

//--------------------------------------------------------------------
// Modules

module "nomad-cluster" {
  source          = "app.terraform.io/Darnold-Hashicorp/nomad-cluster/aws"
  version         = "1.0.1"
  key_name        = "${var.key_name}"
  servers         = "${var.servers}"
  clients         = "${var.clients}"
  consul_cluster  = "${data.aws_instance.consul_instance.private_ip}"
  vault_cluster   = "${data.aws_instance.vault_cluster.address}"
  vault_token     = "${var.vault_token}"
  region          = "${data.terraform_remote_state.network.region}"
  subnet          = "${data.terraform_remote_state.network.public_subnet}"
  vpc_id          = "${data.terraform_remote_state.network.vpc_id}"
  resource_tags   = "${var.resource_tags}"
  service_name    = "nomad"
  service_version = "1.0.0"
}
