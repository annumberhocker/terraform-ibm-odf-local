module "odf_module" {
  source = "./module"
  #source = "../../"

  depends_on = [ module.cluster ]

  ibmcloud_api_key    = var.ibmcloud_api_key
  cluster             = module.cluster.name
}

