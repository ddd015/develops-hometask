resource "kubernetes_service" "wcg-srv" {
  metadata {
    name      = "wcg-service"
    namespace = kubernetes_namespace.wcg-ns.metadata[0].name
  }
  spec {
    selector = {
      "app" = var.app_name
    }
    port {
      node_port   = var.node_port
      port        = var.app_port
      target_port = var.node_port
    }
    type = "NodePort"
  }
}