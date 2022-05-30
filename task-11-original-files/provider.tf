
terraform {
  backend "kubernetes" {
    secret_suffix = "static"
#    host        = "https://192.168.59.100:8443"
    config_path = "~/.kube/config"
#    namespace   = "kube-system"
  }
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.11.0"
    }
    githab = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

provider "github" {
  token = var.git_token
}

provider "kubernetes" {
  host                   = "https://192.168.59.100:8443"
  client_certificate     = file(var.cl_crt)
  client_key             = file(var.cl_key)
  cluster_ca_certificate = file(var.cl_ca_key)
}