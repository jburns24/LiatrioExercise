resource "kubernetes_deployment" "rest-api" {
  metadata {
    name = "scalable-rest-example"
    labels = {
      App = "ScalableRESTExample"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        App = "ScalableRESTExample"
      }
    }
    template {
      metadata {
        labels = {
          App = "ScalableRESTExample"
        }
      }
      spec {
        container {
          image = "jburns24/rest-api:v1.0.0"
          name  = "rest-api"

          port {
            container_port = 80
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
