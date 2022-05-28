
terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.11.0"
    }
  }
}

provider "kubernetes" {
  host = "https://localhost:8443"

  client_certificate     = file("/home/dima/.minikube/profiles/minikube/client.crt")
  client_key             = file("/home/dima/.minikube/profiles/minikube/client.key")
  cluster_ca_certificate = file("/home/dima/.minikube/ca.crt")
}