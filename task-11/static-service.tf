resource "kubernetes_service" "static-srv" {
  metadata {
    name      = "static-service"
    namespace = kubernetes_deployment.static-deployment.metadata[0].name
  }
  spec {
    selector = {
      "app" = var.app_name
    }
    port {
      node_port   = var.node_port
      port        = var.app_port
      target_port = var.app_port
    }
    type = "NodePort"
  }
}