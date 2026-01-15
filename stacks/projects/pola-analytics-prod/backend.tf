terraform {
  backend "gcs" {
    bucket = "kj-pola-analitics-terraform-prod"
    prefix = "terraform/state"
  }
}
