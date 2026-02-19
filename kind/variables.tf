variable "cluster_name" {
  type    = string
  default = "iac-kind-cluster1"
}

variable "node_image" {
  type    = string
  default = "kindest/node:v1.31.0"
}

variable "wait_for_ready" {
  type    = bool
  default = true
}

variable "kind_config" {
  type = map(string)
  default = {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"
  }
}
