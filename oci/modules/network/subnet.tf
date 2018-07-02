resource "oci_core_subnet" "NATSubnetAD1" {
  count               = "1"
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[0],"name")}"
  cidr_block          = "${lookup(var.network_cidrs, "natSubnetAD1")}"
  display_name        = "${var.label_prefix}-nat-ad1"
  compartment_id      = "${var.compartment_id}"
  vcn_id              = "${oci_core_virtual_network.cross-cloud-vcn.id}"
  route_table_id      = "${oci_core_route_table.public-route-table.id}"
  security_list_ids   = ["${list(oci_core_security_list.NatSecurityList.id)}"]
  dhcp_options_id     = "${oci_core_virtual_network.cross-cloud-vcn.default_dhcp_options_id}"
}

resource "oci_core_subnet" "NATSubnetAD2" {
  count               = "1"
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[1],"name")}"
  cidr_block          = "${lookup(var.network_cidrs, "natSubnetAD2")}"
  display_name        = "${var.label_prefix}-nat-ad2"
  compartment_id      = "${var.compartment_id}"
  vcn_id              = "${oci_core_virtual_network.cross-cloud-vcn.id}"
  route_table_id      = "${oci_core_route_table.public-route-table.id}"
  security_list_ids   = ["${list(oci_core_security_list.NatSecurityList.id)}"]
  dhcp_options_id     = "${oci_core_virtual_network.cross-cloud-vcn.default_dhcp_options_id}"
}

resource "oci_core_subnet" "NATSubnetAD3" {
  count               = "1"
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[2],"name")}"
  cidr_block          = "${lookup(var.network_cidrs, "natSubnetAD3")}"
  display_name        = "${var.label_prefix}-nat-ad3"
  compartment_id      = "${var.compartment_id}"
  vcn_id              = "${oci_core_virtual_network.cross-cloud-vcn.id}"
  route_table_id      = "${oci_core_route_table.public-route-table.id}"
  security_list_ids   = ["${list(oci_core_security_list.NatSecurityList.id)}"]
  dhcp_options_id     = "${oci_core_virtual_network.cross-cloud-vcn.default_dhcp_options_id}"
}

resource "oci_core_subnet" "K8sSubnetAD1" {
  count               = "1"
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[0],"name")}"
  cidr_block          = "${lookup(var.network_cidrs, "natSubnetAD1")}"
  display_name        = "${var.label_prefix}publicNATSubnetAD1"
  compartment_id      = "${var.compartment_id}"
  vcn_id              = "${oci_core_virtual_network.cross-cloud-vcn.id}"
  route_table_id      = "${oci_core_route_table.nat-ad1-route-table.id}"
  security_list_ids   = ["${list(oci_core_security_list.K8sSubnetSecurityList.id)}"]
  dhcp_options_id     = "${oci_core_virtual_network.cross-cloud-vcn.default_dhcp_options_id}"
}

resource "oci_core_subnet" "K8sSubnetAD2" {
  count               = "1"
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[1],"name")}"
  cidr_block          = "${lookup(var.network_cidrs, "natSubnetAD2")}"
  display_name        = "${var.label_prefix}publicNATSubnetAD2"
  compartment_id      = "${var.compartment_id}"
  vcn_id              = "${oci_core_virtual_network.cross-cloud-vcn.id}"
  route_table_id      = "${oci_core_route_table.nat-ad2-route-table.id}"
  security_list_ids   = ["${list(oci_core_security_list.K8sSubnetSecurityList.id)}"]
  dhcp_options_id     = "${oci_core_virtual_network.cross-cloud-vcn.default_dhcp_options_id}"
}

resource "oci_core_subnet" "K8sSubnetAD3" {
  count               = "1"
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[2],"name")}"
  cidr_block          = "${lookup(var.network_cidrs, "natSubnetAD3")}"
  display_name        = "${var.label_prefix}publicNATSubnetAD3"
  compartment_id      = "${var.compartment_id}"
  vcn_id              = "${oci_core_virtual_network.cross-cloud-vcn.id}"
  route_table_id      = "${oci_core_route_table.nat-ad3-route-table.id}"
  security_list_ids   = ["${list(oci_core_security_list.K8sSubnetSecurityList.id)}"]
  dhcp_options_id     = "${oci_core_virtual_network.cross-cloud-vcn.default_dhcp_options_id}"
}

resource "oci_core_subnet" "BastionSubnetAD1" {
  count               = "1"
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[0],"name")}"
  cidr_block          = "${lookup(var.network_cidrs, "BastionSubnetAD1")}"
  display_name        = "${var.label_prefix}-bastion-ad1"
  compartment_id      = "${var.compartment_id}"
  vcn_id              = "${oci_core_virtual_network.cross-cloud-vcn.id}"
  route_table_id      = "${oci_core_route_table.public-route-table.id}"
  security_list_ids   = ["${list(oci_core_security_list.BastionSubnetSecurityList.id)}"]
  dhcp_options_id     = "${oci_core_virtual_network.cross-cloud-vcn.default_dhcp_options_id}"
}
