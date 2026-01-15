module "service_account" {
  source  = "terraform-google-modules/service-accounts/google"
  version = "~> 4.6"

  project_id    = var.project_id
  project_roles = var.service_account_roles

  names       = [var.terraform_runner_sa_name]
  description = "Service account używane przez GitHub Actions do uruchamiania Terraform"
}

module "gh_oidc" {
  source  = "terraform-google-modules/github-actions-runners/google//modules/gh-oidc"
  version = "~> 5.1"

  project_id  = var.project_id
  pool_id     = var.workload_identity_pool_id
  provider_id = var.workload_identity_provider_id

  attribute_condition = "assertion.repository == \"${var.github_repository}\""

  sa_mapping = {
    (var.terraform_runner_sa_name) = {
      sa_name   = module.service_account.service_accounts_map[var.terraform_runner_sa_name].name
      attribute = "attribute.repository/${var.github_repository}"
    }
  }
}
