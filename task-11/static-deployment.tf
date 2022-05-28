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
      App = "static"
    }
  }

  spec {
    replicas = 3
    selector {
      match_labels = {
        App = "static"
      }
    }
    template {
      metadata {
        labels = {
          app = "static"
        }
      }
      spec {
        container {
          image             = "ddd015/firstrep:hometask"
          name              = "static"
          image_pull_policy = "IfNotPresent"
          port {
            container_port = 80
          }
        }
      }
    }
  }

}