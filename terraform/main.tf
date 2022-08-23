terraform {
  backend "gcs" {
    bucket = "urban-devops-test-terraform"
    prefix = "state"
  }
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}
