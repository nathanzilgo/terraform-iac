resource "kubernetes_deployment" "app-test" {
  metadata {
    name = "app-test"
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "app-test"
      }
    }
    template {
      metadata {
        labels = {
          app = "app-test"
        }
      }
      spec {
        container {
          name  = "app-test"
          image = "nginxdemos/hello"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "app-test-svc" {
  metadata {
    name = "app-test-svc"
  }
  spec {
    selector = {
      app = "app-test"
    }
    port {
      port        = 80
      target_port = 80
    }
    type = "ClusterIP"
  }
}

resource "kubernetes_ingress_v1" "app-test-ingress" {
  metadata {
    name = "app-test-ingress"
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }
  spec {
    rule {
      host = "app-test.local"
      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = kubernetes_service.app-test-svc.metadata[0].name
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}
