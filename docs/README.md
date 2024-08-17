# Configuração do repositório

Para executar ações na AWS, devemos encontrar alguma forma de autenticar os 2 serviços, a abordagem escolhida foi o `assume role` no repositório para execução da pipeline

## Criar draw.io da infra AWS

- Bastion
- VPC IPv6
- subnet privada
  - pods
  - services
- subnet pública
  - load balancer
- Security Group
- Fargate profile
- EKS
  - Acesso: IAM only
  - Add-ons
    - controlplane
    - lgtm
    - external-secrets
    - metrics-server
