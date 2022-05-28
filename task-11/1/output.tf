output "cluster_ip" {
    value - kubernetes_service.wcg-srv.spec[0].cluster_ip #берем из terraform plan
}

output "image_name" {
    value = kubernetes_deployment.spec[0].template[0].container.0.image
}