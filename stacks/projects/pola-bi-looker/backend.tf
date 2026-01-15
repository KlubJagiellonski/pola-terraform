terraform {
  backend "gcs" {
    bucket = "kj-pola-looker-terraform-prod"
    prefix = "terraform/state"
  }
}
