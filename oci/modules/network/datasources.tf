# List Private IPs on the NAT instances
data "oci_core_private_ips" "cross-cloud-nat-ad1-private-ips" {
  count   = "1"
  vnic_id = "${data.oci_core_vnic.nat-instance-ad1-vnic.id}"
}
data "oci_core_private_ips" "cross-cloud-nat-ad2-private-ips" {
  count   = "1"
  vnic_id = "${data.oci_core_vnic.nat-instance-ad2-vnic.id}"
}
data "oci_core_private_ips" "cross-cloud-nat-ad3-private-ips" {
  count   = "1"
  vnic_id = "${data.oci_core_vnic.nat-instance-ad3-vnic.id}"
}