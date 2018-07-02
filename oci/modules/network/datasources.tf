# List Private IPs on the NAT instances
data "oci_core_private_ips" "cross-cloud-nat-ad1-private-ips" {
  count   = "1"
  vnic_id = "${data.oci_core_vnic.NATInstanceAD1Vnic.id}"
}
data "oci_core_private_ips" "cross-cloud-nat-ad2-private-ips" {
  count   = "1"
  vnic_id = "${data.oci_core_vnic.NATInstanceAD2Vnic.id}"
}
data "oci_core_private_ips" "cross-cloud-nat-ad3-private-ips" {
  count   = "1"
  vnic_id = "${data.oci_core_vnic.NATInstanceAD3Vnic.id}"
}

data "oci_core_vnic" "NATInstanceAD1Vnic" {
  count   = "1"
  vnic_id = "${lookup(data.oci_core_vnic_attachments.NATInstanceAD1Vnics.vnic_attachments[0],"vnic_id")}"
}

data "oci_core_vnic" "NATInstanceAD2Vnic" {
  count   = "1"
  vnic_id = "${lookup(data.oci_core_vnic_attachments.NATInstanceAD1Vnics.vnic_attachments[0],"vnic_id")}"
}

data "oci_core_vnic" "NATInstanceAD3Vnic" {
  count   = "1"
  vnic_id = "${lookup(data.oci_core_vnic_attachments.NATInstanceAD1Vnics.vnic_attachments[0],"vnic_id")}"
}

data "oci_core_vnic_attachments" "NATInstanceAD1Vnics" {
  count               = "1"
  compartment_id      = "${var.compartment_id}"
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[0],"name")}"
  instance_id         = "${oci_core_instance.NATInstanceAD1.id}"
}

data "oci_core_vnic_attachments" "NATInstanceAD2Vnics" {
  count               = "1"
  compartment_id      = "${var.compartment_id}"
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[1],"name")}"
  instance_id         = "${oci_core_instance.NATInstanceAD2.id}"
}

data "oci_core_vnic_attachments" "NATInstanceAD3Vnics" {
  count               = "1"
  compartment_id      = "${var.compartment_id}"
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[2],"name")}"
  instance_id         = "${oci_core_instance.NATInstanceAD3.id}"
}
# List of ADs
data "oci_identity_availability_domains" "ADs" {
  compartment_id = "${var.tenancy_id}"
}

data "oci_core_images" "ImageOCID" {
  compartment_id = "${var.compartment_id}"
  display_name   = "${var.nat_instance_oracle_linux_image_name}"
}