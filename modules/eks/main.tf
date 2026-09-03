module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = var.eks_name
  kubernetes_version = var.k8s_version

  endpoint_public_access = true

  enable_cluster_creator_admin_permissions = true

  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnets

  addons = {
    vpc-cni = {
      before_compute = true
    }

    kube-proxy = {}

    coredns = {}
  }

  eks_managed_node_groups = {
    default = {
      instance_types = ["m7i-flex.large"]

      min_size     = 1
      max_size     = 3
      desired_size = 2
    }
  }
}
