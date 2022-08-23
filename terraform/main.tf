terraform {
  backend "gcs" {
    bucket      = "urban-devops-test-terraform"
    prefix      = "state"
    credentials = "credentials.json"
  }
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}
