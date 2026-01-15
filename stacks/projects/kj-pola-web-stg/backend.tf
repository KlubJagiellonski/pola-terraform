terraform {
  backend "gcs" {
    bucket = "kj-pola-web-terraform-stg"
    prefix = "terraform/state"
  }
}
