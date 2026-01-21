provider "google" {
  project = var.project_id
  region  = var.region

  default_labels = {
    org       = var.name.org
    app       = var.name.app
    iac       = var.name.iac
    component = var.name.component
    env       = var.name.env
  }
}
