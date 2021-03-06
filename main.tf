##################################
# Install ODF on the cluster
##################################

locals {
  installation_content = templatefile("${path.module}/templates/install_odf.yaml.tmpl", {
    monSize = var.monSize,
    monStorageClassName = var.monStorageClassName,
    osdStorageClassName = var.osdStorageClassName,
    osdSize = var.osdSize,
    numOfOsd = var.numOfOsd, 
    billingType = var.billingType,
    ocsUpgrade = var.ocsUpgrade
  })
}

# Install ODF if the rocks version is v4.7 or newer
resource "null_resource" "enable_odf" {
  count = 1
  
  triggers = {
    IC_API_KEY = var.ibmcloud_api_key
    CLUSTER = var.cluster_name
  }

  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]
    command = "${path.module}/scripts/install_odf.sh"

    environment = {
      IC_API_KEY = var.ibmcloud_api_key
      CLUSTER = var.cluster_name
      ODF_CR_CONTENT = local.installation_content
    }
  }

  provisioner "local-exec" {
    when        = destroy

    interpreter = ["/bin/bash", "-c"]
    command = "${path.module}/scripts/uninstall_odf.sh"

    environment = {
      IC_API_KEY = self.triggers.IC_API_KEY
      CLUSTER = self.triggers.CLUSTER
    }
  }
}
