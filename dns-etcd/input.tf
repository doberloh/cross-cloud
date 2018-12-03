variable "name" {}
variable "etcd_server" {}
variable "discovery_nameserver" {}
variable "upstream_dns" {}
variable "cloud_provider" {}
variable "master_ips" {}
variable "public_master_ips" {}
variable "public_worker_ips" { default = "null" }
variable "worker_ips" {}
variable "master_node_count" {}
variable "worker_node_count" {}