module "vpc" {
  source     = "./modules/vpc"
  name       = "urban-devops-test"
  project_id = var.project_id
}

module "gke_cluster" {
  source             = "./modules/gke"
  project_id         = var.project_id
  name               = "urban-devops-test"
  region             = var.region
  network            = module.vpc.id
  instance_type      = "e2-micro"
  preemptible        = true
  kubernetes_version = "1.22"
  network_cidr       = module.vpc.cidr
}
