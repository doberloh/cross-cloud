resource "oci_core_security_list" "NatSecurityList" {
  count          = "1"
  compartment_id = "${var.compartment_id}"
  display_name   = "${var.label_prefix}-nat-sec-list"
  vcn_id         = "${oci_core_virtual_network.cross-cloud-vcn.id}"

  egress_security_rules = [{
    protocol    = "all"
    destination = "0.0.0.0/0"
  }]

  ingress_security_rules = [
    {
      # Allow internal VCN traffic
      protocol = "all"
      source   = "${lookup(var.network_cidrs, "VCN-CIDR")}"
    },
    {
      # Access to SSH port to instances on the public network (like the NAT instance or a user-defined LB)
      protocol = "6"
      source   = "${var.public_subnet_ssh_ingress}"

      tcp_options {
        "min" = 22
        "max" = 22
      }
    }
  ]
}

resource "oci_core_security_list" "K8sSubnetSecurityList" {
  compartment_id = "${var.compartment_id}"
  display_name   = "${var.label_prefix}-k8s-sec-list"
  vcn_id         = "${oci_core_virtual_network.cross-cloud-vcn.id}"

  egress_security_rules = [
    {
      destination = "0.0.0.0/0"
      protocol    = "all"
    },
  ]

  ingress_security_rules = [
    {
      protocol = "1"
      source   = "${var.internal_icmp_ingress}"

      icmp_options {
        "type" = 3
        "code" = 4
      }
    },
    {
      # LBaaS and internal VCN traffic
      protocol = "6"
      source   = "${lookup(var.network_cidrs, "LBAAS-PHOENIX-1-CIDR")}"
    },
    {
      protocol = "6"
      source   = "${lookup(var.network_cidrs, "LBAAS-ASHBURN-1-CIDR")}"
    },
    {
      protocol = "all"
      source   = "${lookup(var.network_cidrs, "VCN-CIDR")}"
    }
  ]

  provisioner "local-exec" {
    command = "sleep 5"
  }
}

resource "oci_core_security_list" "BastionSubnetSecurityList" {
  compartment_id = "${var.compartment_id}"
  display_name   = "${var.label_prefix}-bastion-sec-list"
  vcn_id         = "${oci_core_virtual_network.cross-cloud-vcn.id}"

  egress_security_rules = [
    {
      destination = "0.0.0.0/0"
      protocol    = "all"
    },
  ]

  ingress_security_rules = [
    {
      protocol = "1"
      source   = "${var.internal_icmp_ingress}"

      icmp_options {
        "type" = 3
        "code" = 4
      }
    },
    {
      protocol = "all"
      source   = "${lookup(var.network_cidrs, "VCN-CIDR")}"
    },
    {
      protocol = "6"
      source   = "${var.public_subnet_ssh_ingress}"

      tcp_options {
        "min" = 22
        "max" = 22
      }
    }
  ]

  provisioner "local-exec" {
    command = "sleep 5"
  }
}
