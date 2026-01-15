provider "google" {
  project = var.project_id
  region  = var.region

  default_labels = {
    org       = var.labels.org
    app       = var.labels.app
    iac       = var.labels.iac
    component = var.labels.component
    env       = var.labels.env
  }
}
