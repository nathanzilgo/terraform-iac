resource "helm_release" "ingress-nginx" {
  name             = "ingress-nginx"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = "ingress-nginx"
  create_namespace = true
  timeout          = 300

  # Garante que o cluster seja criado antes do Helm tentar instalar algo
  depends_on = [kind_cluster.c1]

  # Configuração específica para o Kind entender o tráfego local
  set {
    name  = "controller.service.type"
    value = "NodePort"
  }

  set {
    name  = "controller.admissionWebhooks.enabled"
    value = "false"
  }

  set {
    name  = "controller.hostPort.enabled"
    value = "true"
  }

  set {
    name  = "controller.service.nodePorts.http"
    value = "30080"
  }

  set {
    name  = "controller.service.nodePorts.https"
    value = "30443"
  }

  values = [
    yamlencode({
      controller = {
        nodeSelector = {
          "kubernetes.io/hostname" = "${kind_cluster.c1.name}-control-plane"
        }
        tolerations = [
          {
            key      = "node-role.kubernetes.io/control-plane"
            operator = "Exists"
            effect   = "NoSchedule"
          }
        ]
      }
    })
  ]

}
