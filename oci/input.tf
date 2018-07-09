# oci auth settings
variable "oci_tenancy_ocid" { default="ocid1.tenancy.oc1..aaaaaaaa5ple5x76vi7gkkysiqtih2qonobupwxdqzukbi2i6n6shdpxymza"}
variable "oci_user_ocid" { default="ocid1.user.oc1..aaaaaaaad4csmhthowbiuncpw2vbtkqlqrojy74jnify2257thjwkbbuvc2a" }
variable "oci_fingerprint" { default="69:46:ac:93:9b:57:77:15:a6:50:87:bb:06:16:66:e5" }
variable "oci_private_key_path" { default="~/.oci/oci_api_key.pem" }
variable "oci_region" { default = "us-phoenix-1" }

# general
variable "label_prefix" { default = "crosscloud"}

# ssh
variable "ssh_private_key" { default = "" }
variable "ssh_public_key" { default = "" }

# network vars
variable "external_icmp_ingress" { default = "0.0.0.0/0" }
variable "internal_icmp_ingress" { default = "10.0.0.0/16" }
variable "public_subnet_ssh_ingress" { default = "0.0.0.0/0" }
variable "etcd_cluster_ingress" { default = "10.0.0.0/16" }
variable "worker_ssh_ingress" { default = "10.0.0.0/16" }
variable "nat_instance_oracle_linux_image_name" { default = "Oracle-Linux-7.5-2018.04.20-1" }
variable "nat_instance_shape" { default = "VM.Standard1.1" }
variable "network_cidrs" {
  type = "map"
  default = {
    LBAAS-PHOENIX-1-CIDR  = "129.144.0.0/12"
    LBAAS-ASHBURN-1-CIDR  = "129.213.0.0/16"
    VCN-CIDR              = "10.0.0.0/16"
    natSubnetAD1          = "10.0.13.0/24"
    natSubnetAD2          = "10.0.14.0/24"
    natSubnetAD3          = "10.0.15.0/24"
    kubeSubnetAD1         = "10.0.16.0/24"
    kubeSubnetAD2         = "10.0.17.0/24"
    kubeSubnetAD3         = "10.0.18.0/24"
    BastionSubnetAD1      = "10.0.19.0/24"
  }
}

#master vars
