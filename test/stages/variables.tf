variable "resource_group_name" {
  type        = string
  description = "Existing resource group where the IKS cluster will be provisioned."
  default     = "Default"
}
variable "region" {
  type        = string
  description = "Region for VLANs defined in private_vlan_number and public_vlan_number."
}

variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud api token"
  default     = ""
}

# variable "cluster_name" {
#   type        = string
#   description = "The name of the cluster"
#   default     = ""
# }

variable "name_prefix" {
  type        = string
  description = "Prefix name that should be used for the cluster and services. If not provided then resource_group_name will be used"
  default     = ""
}

variable "flavor" {
  type        = string
  description = "The machine type that will be provisioned for classic infrastructure"
  default     = "bx2.16x64"
}

variable "worker_count" {
  type        = number
  default     = 3
}

variable "ocp_version" {
  type        = string
  default     = "4.8"
}

variable "ocp_entitlement" {
  type        = string
  description = "Value that is applied to the entitlements for OCP cluster provisioning"
  default     = "cloud_pak"
}

variable "force_delete_storage" {
  type        = bool
  description = "Attribute to force the removal of persistent storage associtated with the cluster"
  default     = false
}

# variable "vpc_cluster" {
#   type        = bool
#   description = "Flag indicating that this is a vpc cluster"
#   default     = true
# }

variable "vpc_public_gateway" {
  type        = string
  description = "Flag indicating the public gateway should be created"
  default     = "true"
}

variable "vpc_subnet_count" {
  type        = number
  description = "The number of subnets to create for the VPC instance"
  default     = 1
}

variable "vpc_subnets" {
  type        = string
  description = "JSON representation of list of object, e.g. [{\"label\"=\"default\"}]"
  default     = "[]"
}

variable "vpc_subnet_label" {
  type        = string
  default     = "cluster"
}

