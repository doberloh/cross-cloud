resource "oci_core_instance" "NATInstanceAD1" {
  count               = "1"
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[0],"name")}"
  compartment_id      = "${var.compartment_id}"
  display_name        = "${var.label_prefix}-nat-ad1"
  shape               = "${var.nat_instance_shape}"

  source_details      {
    source_type = "image"
    source_id   = "${lookup(data.oci_core_images.ImageOCID.images[0], "id")}"
  }

  create_vnic_details {
    subnet_id = "${element(concat(oci_core_subnet.NATSubnetAD1.*.id,list("")),0)}"

    # Skip the source/destination check so that the VNIC will forward traffic.
    skip_source_dest_check = true
  }

  metadata {
    ssh_authorized_keys = "${var.ssh_public_key}"

    # Automate NAT instance configuration with cloud init run at launch
    user_data = "${base64encode(file("${path.module}/cloud_init/bootstrap.template.yaml"))}"
  }

  timeouts {
    create = "10m"
  }
}

resource "oci_core_instance" "NATInstanceAD2" {
  count               = "1"
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[1],"name")}"
  compartment_id      = "${var.compartment_id}"
  display_name        = "${var.label_prefix}-nat-ad2"
  shape               = "${var.nat_instance_shape}"

  source_details      {
    source_type = "image"
    source_id   = "${lookup(data.oci_core_images.ImageOCID.images[0], "id")}"
  }

  create_vnic_details {
    subnet_id = "${element(concat(oci_core_subnet.NATSubnetAD2.*.id,list("")),0)}"

    # Skip the source/destination check so that the VNIC will forward traffic.
    skip_source_dest_check = true
  }

  metadata {
    ssh_authorized_keys = "${var.ssh_public_key}"

    # Automate NAT instance configuration with cloud init run at launch
    user_data = "${base64encode(file("${path.module}/cloud_init/bootstrap.template.yaml"))}"
  }

  timeouts {
    create = "10m"
  }
}

resource "oci_core_instance" "NATInstanceAD3" {
  count               = "1"
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[2],"name")}"
  compartment_id      = "${var.compartment_id}"
  display_name        = "${var.label_prefix}-nat-ad3"
  shape               = "${var.nat_instance_shape}"

  source_details      {
    source_type = "image"
    source_id   = "${lookup(data.oci_core_images.ImageOCID.images[0], "id")}"
  }

  create_vnic_details {
    subnet_id = "${element(concat(oci_core_subnet.NATSubnetAD3.*.id,list("")),0)}"

    # Skip the source/destination check so that the VNIC will forward traffic.
    skip_source_dest_check = true
  }

  metadata {
    ssh_authorized_keys = "${var.ssh_public_key}"

    # Automate NAT instance configuration with cloud init run at launch
    user_data = "${base64encode(file("${path.module}/cloud_init/bootstrap.template.yaml"))}"
  }

  timeouts {
    create = "10m"
  }
}