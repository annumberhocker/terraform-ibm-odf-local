module "subnets" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpc-subnets.git"

  resource_group_name = module.resource_group.name
  region            = var.region
  vpc_name          = module.vpc.name
  gateways          = module.gateways.gateways
  _count            = var.vpc_subnet_count
  label             = var.vpc_subnet_label
}
