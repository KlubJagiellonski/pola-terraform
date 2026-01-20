module "docker_registry" {
  source  = "GoogleCloudPlatform/artifact-registry/google"
  version = "~> 0.8.2"

  project_id    = var.project_id
  location      = var.region
  format        = "DOCKER"
  repository_id = var.docker_registry_repository_id

  description = "Rejestr Docker dla obrazów kontenerowych Pola backend"
}
