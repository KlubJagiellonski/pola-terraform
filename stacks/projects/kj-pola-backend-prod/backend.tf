terraform {
  backend "gcs" {
    bucket = "kj-pola-backend-terraform-prod"
    prefix = "terraform/state"
  }
}
