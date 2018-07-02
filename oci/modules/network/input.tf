variable "network_cidrs" { type = "map" }
variable "compartment_id" {}
variable "label_prefix" {}
variable "tenancy_id" {}
variable "nat_instance_oracle_linux_image_name" {}
variable "nat_instance_shape" {}
variable "ssh_public_key" {}
variable "external_icmp_ingress" {}
variable "internal_icmp_ingress" {}
variable "public_subnet_ssh_ingress" {}
variable "etcd_cluster_ingress" {}
