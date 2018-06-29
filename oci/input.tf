# oci auth settings
variable "oci_tenancy_ocid" {}
variable "oci_user_ocid" {}
variable "oci_fingerprint" {}
variable "oci_private_key_path" {}
variable "oci_region" { default = "us-phoenix-1" }

# general
variable "label_prefix" { default = "cross-cloud"}

# network vars
variable "network_cidrs" {
  type = "map"

  default = {
    VCN-CIDR          = "10.0.0.0/16"
    PublicSubnetAD1   = "10.0.10.0/24"
    PublicSubnetAD2   = "10.0.11.0/24"
    PublicSubnetAD3   = "10.0.12.0/24"
    natSubnetAD1      = "10.0.13.0/24"
    natSubnetAD2      = "10.0.14.0/24"
    natSubnetAD3      = "10.0.15.0/24"
    etcdSubnetAD1     = "10.0.20.0/24"
    etcdSubnetAD2     = "10.0.21.0/24"
    etcdSubnetAD3     = "10.0.22.0/24"
    masterSubnetAD1   = "10.0.30.0/24"
    masterSubnetAD2   = "10.0.31.0/24"
    masterSubnetAD3   = "10.0.32.0/24"
    workerSubnetAD1   = "10.0.40.0/24"
    workerSubnetAD2   = "10.0.41.0/24"
    workerSubnetAD3   = "10.0.42.0/24"
    k8sCCMLBSubnetAD1 = "10.0.50.0/24"
    k8sCCMLBSubnetAD2 = "10.0.51.0/24"
    k8sCCMLBSubnetAD3 = "10.0.52.0/24"
  }
}
