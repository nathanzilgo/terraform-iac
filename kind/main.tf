resource "kind_cluster" "c1" {
  name           = var.cluster_name
  node_image     = var.node_image
  wait_for_ready = var.wait_for_ready

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"
    }
    node {
      role = "worker"
    }
    node {
      role = "worker"
    }
  }
}

output "cluster_name" {
  value = kind_cluster.c1.name
}

output "cluster_endpoint" {
  value = kind_cluster.c1.endpoint
}

output "cluster_kubeconfig" {
  value = kind_cluster.c1.kubeconfig
}
