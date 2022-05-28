resource "kubernetes_namespace" "wcg-ns" {
  metadata {
      name = "wcg-ns"
      name = "${local.prefix}-ns" - Это с local.tf локал префикс задаем в ком строке
  }
}



resource "kubernetes_deployment" "wcg-deployment" {
  metadata {
    name = "wcg-deployment"
    namespace = kubernetes_namespace.wcg-ns.metadata[0].name
    labels = {
      App = var.app_name
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        App = var.app_name
      }
    }
    template {
      metadata {
        labels = {
          App = "wcg"
        }
      }
      spec {
        container {
          image             = "wcg-1:latest"
          name              = var.app_name
          image_pull_policy = "IfNotPresent"

          port {
            container_port = var.app_port
          }
          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}