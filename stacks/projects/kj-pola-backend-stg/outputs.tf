output "vpc_network_name" {
  description = "Nazwa sieci VPC"
  value       = module.vpc.network.name
}

output "vpc_network_id" {
  description = "ID sieci VPC"
  value       = module.vpc.network.id
}

output "vpc_network_self_link" {
  description = "Self link sieci VPC"
  value       = module.vpc.network.self_link
}

output "vpc_subnet_name" {
  description = "Nazwa podsieci VPC"
  value       = "${var.name.app}-${var.name.component}-${var.name.env}-subnet"
}

output "vpc_subnet_id" {
  description = "ID podsieci VPC"
  value       = try(module.vpc.subnets["${var.region}/${var.name.app}-${var.name.component}-${var.name.env}-subnet"].id, module.vpc.subnets["${var.name.app}-${var.name.component}-${var.name.env}-subnet"].id)
}

output "vpc_subnet_self_link" {
  description = "Self link podsieci VPC"
  value       = try(module.vpc.subnets["${var.region}/${var.name.app}-${var.name.component}-${var.name.env}-subnet"].self_link, module.vpc.subnets["${var.name.app}-${var.name.component}-${var.name.env}-subnet"].self_link)
}

output "private_service_access_address" {
  description = "Adresacja IP dla Private Service Access"
  value       = var.private_service_access_cidr
}
