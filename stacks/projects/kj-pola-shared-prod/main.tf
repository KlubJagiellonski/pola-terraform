module "project_services" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "~> 18.0"

  project_id    = var.project_id
  activate_apis = var.activate_apis
}
