terraform {
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "0.6.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.11.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.21.0"
    }
  }
}
provider "helm" {
  kubernetes {
    host                   = kind_cluster.c1.endpoint
    cluster_ca_certificate = kind_cluster.c1.cluster_ca_certificate
    client_certificate     = kind_cluster.c1.client_certificate
    client_key             = kind_cluster.c1.client_key
  }
}

provider "kubernetes" {
  host                   = kind_cluster.c1.endpoint
  cluster_ca_certificate = kind_cluster.c1.cluster_ca_certificate
  client_certificate     = kind_cluster.c1.client_certificate
  client_key             = kind_cluster.c1.client_key
}

provider "kind" {}
