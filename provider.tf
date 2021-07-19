provider "vault" {
  token_name = "terraform"
}

data "vault_generic_secret" "gcp_credentials" {
  path = "kv/GCP/Creds/db/"
}

provider "google" {
  credentials = data.vault_generic_secret.gcp_credentials.data_json
  project     = var.project_id
}