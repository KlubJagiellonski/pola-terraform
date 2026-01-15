terraform {
  backend "gcs" {
    bucket = "kj-pola-web-terraform-prod"
    prefix = "terraform/state"
  }
}
