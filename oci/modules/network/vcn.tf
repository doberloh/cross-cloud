resource "oci_core_virtual_network" "cross-cloud-vcn" {
  cidr_block        = "${lookup(var.network_cidrs, "VCN-CIDR")}"
  compartment_id    = "${var.compartment_id}"
  display_name      = "${var.label_prefix}-vcn"
  dns_label         = "${var.label_prefix}"
}

resource "oci_core_internet_gateway" "cross-cloud-ig" {
  compartment_id = "${var.compartment_id}"
  display_name   = "${var.label_prefix}-ig"
  vcn_id         = "${oci_core_virtual_network.cross-cloud-vcn.id}"
}

resource "oci_core_route_table" "cross-cloud-public-route-table" {
  compartment_id = "${var.compartment_id}"
  vcn_id         = "${oci_core_virtual_network.cross-cloud-vcn.id}"
  display_name   = "${var.label_prefix}-public-route-table"

  route_rules {
    cidr_block = "0.0.0.0/0"

    # Internet Gateway route target for instances on public subnets
    network_entity_id = "${oci_core_internet_gateway.cross-cloud-ig.id}"
  }
}

resource "oci_core_route_table" "nat-ad1-route-table" {
  count          = "1"
  compartment_id = "${var.compartment_id}"
  vcn_id         = "${oci_core_virtual_network.cross-cloud-vcn.id}"
  display_name   = "${var.label_prefix}-nat-ad1"

  route_rules {
    # All traffic leaving the subnet needs to go to route target.
    cidr_block = "0.0.0.0/0"

    # Private IP route target for instances on private AD1 subnets
    network_entity_id = "${data.oci_core_private_ips.cross-cloud-nat-ad1-private-ips.private_ips.0.id}"
  }
}

resource "oci_core_route_table" "nat-ad2-route-table" {
  count          = "1"
  compartment_id = "${var.compartment_id}"
  vcn_id         = "${oci_core_virtual_network.cross-cloud-vcn.id}"
  display_name   = "${var.label_prefix}-nat-ad2"

  route_rules {
    # All traffic leaving the subnet needs to go to route target.
    cidr_block = "0.0.0.0/0"

    # Private IP route target for instances on private AD1 subnets
    network_entity_id = "${data.oci_core_private_ips.cross-cloud-nat-ad2-private-ips.private_ips.0.id}"
  }
}

resource "oci_core_route_table" "nat-ad3-route-table" {
  # Provisioned only when k8s instances in AD1 are in private subnets
  count          = "1"
  compartment_id = "${var.compartment_id}"
  vcn_id         = "${oci_core_virtual_network.cross-cloud-vcn.id}"
  display_name   = "${var.label_prefix}-nat-ad3"

  route_rules {
    # All traffic leaving the subnet needs to go to route target.
    cidr_block = "0.0.0.0/0"

    # Private IP route target for instances on private AD1 subnets
    network_entity_id = "${data.oci_core_private_ips.cross-cloud-nat-ad3-private-ips.private_ips.0.id}"
  }
}
