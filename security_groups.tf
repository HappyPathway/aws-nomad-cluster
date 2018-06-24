resource "aws_security_group_rule" "consul_client_tcp" {
  security_group_id        = "${data.terraform_remote_state.consul_cluster.cluster_sg}"
  source_security_group_id = "${module.nomad_cluster.vault_security_group}"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "tcp"
  type                     = "ingress"
}

resource "aws_security_group_rule" "consul_client_udp" {
  security_group_id        = "${data.terraform_remote_state.consul_cluster.cluster_sg}"
  source_security_group_id = "${module.nomad_cluster.vault_security_group}"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "udp"
  type                     = "ingress"
}
