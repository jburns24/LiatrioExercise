resource "kubernetes_service" "rest-api" {
  metadata {
    name = "rest-example"
  }
  spec {
    selector = {
      App = kubernetes_deployment.rest-api.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
