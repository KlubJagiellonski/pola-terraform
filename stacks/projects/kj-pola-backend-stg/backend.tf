terraform {
  backend "gcs" {
    bucket = "kj-pola-backend-terraform-stg"
    prefix = "terraform/state"
  }
}
