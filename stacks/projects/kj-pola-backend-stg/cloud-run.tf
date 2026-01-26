module "cloud_run" {
  source = "github.com/GoogleCloudPlatform/cloud-foundation-fabric//modules/cloud-run-v2?ref=v51.0.0"

  project_id = var.project_id
  region     = var.region
  name       = "${var.name.app}-${var.name.component}-${var.name.env}"

  containers = {
    app = {
      image = var.cloud_run_image
      volume_mounts = {
        cloudsql = "/cloudsql"
      }
      resources = {
        limits = {
          cpu    = var.cloud_run_cpu_limit
          memory = var.cloud_run_memory_limit
        }
      }
    }
  }

  volumes = {
    cloudsql = {
      cloud_sql_instances = [module.cloudsql.instance_connection_name]
    }
  }

  service_account_config = {
    roles = var.cloud_run_service_account_roles
  }

  # Terraform does the initial deployment only; CI/CD manages revisions after.
  managed_revision = false

  service_config = {
    ingress = "INGRESS_TRAFFIC_ALL"
    scaling = {
      min_instance_count = var.cloud_run_min_instances
      max_instance_count = var.cloud_run_max_instances
    }
  }

  depends_on = [
    module.vpc,
    module.cloudsql
  ]
}

# Grant Cloud Run service account permission to read from Artifact Registry in shared project
# This is needed because the Docker image is in kj-pola-shared-prod project
resource "google_project_iam_member" "cloud_run_sa_artifact_registry_reader" {
  project = "kj-pola-shared-prod"
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:${module.cloud_run.service_account_email}"

  depends_on = [
    module.cloud_run
  ]
}
