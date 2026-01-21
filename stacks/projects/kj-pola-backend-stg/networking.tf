module "vpc" {
  source = "github.com/GoogleCloudPlatform/cloud-foundation-fabric//modules/net-vpc?ref=v51.0.0"

  project_id = var.project_id
  name       = "${var.name.app}-${var.name.component}-${var.name.env}-vpc"

  subnets = [
    {
      name                  = "${var.name.app}-${var.name.component}-${var.name.env}-subnet"
      ip_cidr_range         = var.vpc_subnet_cidr
      region                = var.region
      description           = var.vpc_subnet_description
      enable_private_access = true
    }
  ]

  psa_configs = [
    {
      ranges = {
        "${var.name.app}-${var.name.component}-${var.name.env}-psa-range" = var.private_service_access_cidr
      }
    }
  ]
}
