provider "ibm" {}

resource "ibm_space" "space" {
  name        = "${ var.name }"
  org         = "${ var.org }"
}

data "ibm_org" "orgdata" {
  org = "${var.org}"
}

data "ibm_account" "accountData" {
  org_guid = "${data.ibm_org.orgdata.id}"
}

data "ibm_network_vlan" "vlan_public" {
  name = "public"
}

data "ibm_network_vlan" "vlan_private" {
  name = "private"
}

resource "ibm_container_cluster" "testacc_cluster" {
  name            = "${ var.name }"
  datacenter      = "${ var.zone }"
  machine_type    = "${ var.type }"
  hardware        = "${ var.isolation }"
  public_vlan_id  = "${ data.ibm_network_vlan.vlan_public.id }"
  private_vlan_id = "${ data.ibm_network_vlan.vlan_private.id }"
  no_subnet       = false
  worker_num = 1
  org_guid     = "${ data.ibm_org.orgdata.id }"
  space_guid   = "${ var.name }"
  account_guid = "${ data.ibm_account.accountData.id }"
}

data "ibm_container_cluster_config" "cluster_config" {
  cluster_name_id = "${ibm_container_cluster.testacc_cluster.name}"
  org_guid        = "${data.ibm_org.orgdata.id}"
  space_guid      = "${ibm_space.space.id}"
  account_guid    = "${data.ibm_account.accountData.id}"
  config_dir      = "${ var.data_dir }"
}

resource "null_resource" "kubeconfig" {

  provisioner "local-exec" {
    command = <<LOCAL_EXEC
cp "${ var.data_dir }"/*/* "${ var.data_dir }"
mv "${ var.data_dir }"/config.yml "${ var.data_dir}"/kubeconfig
sed -i "/certificate-authority:/c\    certificate-authority-data: $( base64 "${ var.data_dir }"/*.pem | tr -d '\n')" "${ var.data_dir}"/kubeconfig
LOCAL_EXEC
  }

  depends_on = ["data.ibm_container_cluster_config.cluster_config"]
}
