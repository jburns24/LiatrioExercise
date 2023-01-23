# Defines information that you want to print at the end of applying
# and execution plan. Also this data I think gets saved in the tfstate file
# and output by the `terraform output` command. Usefule for passing
# state to dependent modules (see ./kubernetes-tf/kubernetes.tf)
output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane"
  value       = module.eks.cluster_security_group_id
}

output "region" {
  description = "AWS region"
  value       = var.region
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.eks.cluster_name
}
