//--------------------------------------------------------------------
// Variables

provider "aws" {
  region = "${data.terraform_remote_state.network.region}"
}

//--------------------------------------------------------------------
// Modules

module "nomad_cluster" {
  source          = "app.terraform.io/Darnold-Hashicorp/nomad-cluster/aws"
  version         = "1.0.4"
  key_name        = "${var.key_name}"
  servers         = "${var.servers}"
  clients         = "${var.clients}"
  vault_token     = "${var.vault_token}"
  resource_tags   = "${var.resource_tags}"
  region          = "${data.terraform_remote_state.network.region}"
  subnet          = "${data.terraform_remote_state.network.public_subnet}"
  vpc_id          = "${data.terraform_remote_state.network.vpc_id}"
  consul_cluster  = "${data.aws_instance.consul_instance.private_ip}"
  vault_cluster   = "${data.aws_instance.vault_cluster.address}"
  service_name    = "nomad"
  service_version = "1.0.0"
}
