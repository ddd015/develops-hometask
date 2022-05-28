resource "kubernetes_namespace" "static-ns" {
  metadata {
    name = "static-ns"
  }
}

resource "kubernetes_deployment" "static-deployment" {
  metadata {
    name      = "static-deployment"
    namespace = kubernetes_namespace.static-ns.metadata[0].name
    labels = {
      app = var.app_name
    }
  }

  spec {
    replicas = var.repl_count
    selector {
      match_labels = {
        app = var.app_name
      }
    }
    template {
      metadata {
        labels = {
          app = var.app_name
        }
      }
      spec {
        container {
          image             = var.image_name
          name              = var.app_name
          image_pull_policy = "IfNotPresent"
          port {
            container_port = var.app_port
          }
        }
      }
    }
  }

}