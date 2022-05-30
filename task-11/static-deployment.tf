resource "kubernetes_namespace" "static-ns" {
  metadata {
    name = "static-ns"
  }
}

resource "kubernetes_deployment" "static-deployment" {
  metadata {
    name      = "static-deployment"
    namespace = "static-ns"
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
          readiness_probe {
            initial_delay_seconds = 15
            timeout_seconds = 5
            http_get {
              path = "/"
              port = var.app_port
            }
          }
          liveness_probe {
            initial_delay_seconds = 10
            timeout_seconds = 2
            http_get {
              path = "/"
              port = var.app_port
            }
          }
        }
      }
    }
  }

}