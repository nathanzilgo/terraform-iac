# terraform-iac

## Project Overview
Cluster Kubernetes multinó (1 Control-Plane, 2 Workers) provisionado via Terraform sobre Docker (Kind), com Nginx Ingress gerenciado via Helm.

## Tech Stack
IaC: Terraform

Orquestrador: Kubernetes (Kind)

Package Manager: Helm

Ingress: Nginx Ingress Controller

## Arquitetura de Rede
O projeto utiliza hostNetwork e extraPortMappings para expor o tráfego do Host (Porta 80) diretamente para o Ingress Controller dentro do cluster, permitindo acesso via localhost ou domínios locais configurados no /etc/hosts.

## kind

Destroy ingress:
```bash
terraform destroy -target=helm_release.ingress_nginx
```

Destroy main cluster and kind cluster:
```bash
terraform destroy
```