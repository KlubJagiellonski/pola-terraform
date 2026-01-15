terraform {
  backend "gcs" {
    bucket = "kj-pola-shared-terraform-prod"
    prefix = "terraform/state"
  }
}
