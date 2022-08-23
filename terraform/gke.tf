data "google_client_config" "provider" {}

resource "google_container_registry" "registry" {
  location = "EU"
}
