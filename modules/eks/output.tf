output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_security_group_arn" {
  value = module.eks.cluster_security_group_arn
}

output "name" {
  value = module.eks.cluster_name
}
