module "vpc" {
  source = "./modules/vpc"

  project_name         = var.project_name
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway
}

module "iam" {
  source = "./modules/iam"
}

#module "eks_nodes" {
#source = "./modules/node"

#node_role_arn = module.iam.node_role_arn
#cluster_name = module.eks.name
#private_subnets = module.vpc.private_subnets
#}

module "eks" {
  source = "./modules/eks"

  #cluster_addons = {
  #coredns = {}
  #kube-proxy = {}
  #vpc-cni = {}
  #}

  eks_name        = var.eks_name
  k8s_version     = var.k8s_version
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  public_subnets  = module.vpc.public_subnets
}
