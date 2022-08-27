data "google_client_config" "provider" {}

resource "google_artifact_registry_repository" "registry" {
  location      = var.region
  repository_id = "urban-devops-test"
  format        = "DOCKER"
}
