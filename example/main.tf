provider "ibm" {
}

// Module:
module "odf" {
  source = "./.."
  cluster = var.cluster_id
  ibmcloud_api_key = var.ibmcloud_api_key
}
