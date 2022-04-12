provider "ibm" {
}

// Module:
module "odf" {
  source = "./.."
  cluster_id = var.cluster_id
  ibmcloud_api_key = var.ibmcloud_api_key
}
