# terraform-iac

## kind

Destroy ingress:
```bash
terraform destroy -target=helm_release.ingress_nginx
```

Destroy main cluster and kind cluster:
```bash
terraform destroy
```