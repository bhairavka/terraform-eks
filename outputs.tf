output "cluster_id" {
    description = "The ID of the EKS cluster"
    value = module.eks.cluster_id
}
output "cluster_endpoint" {
    description = "The endpoint of the EKS cluster"
    value = module.eks.cluster_endpoint 
}
output "cluster_security_group_id" {
    description = "The security group ID of the EKS cluster"
    value = module.eks.cluster_security_group_id
}
output "oidc_arn" {
    description = "The ARN of the OIDC provider for the EKS cluster"
    value = module.eks.oidc_provider_arn
}
output "oidc_url" {
    description = "The URL of the OIDC provider for the EKS cluster"
    value = module.eks.cluster_oidc_issuer_url
}
output "region" {
    description = "The AWS region where the resources are deployed"
    value = var.aws_region
}