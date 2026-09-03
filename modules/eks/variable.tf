variable "eks_name"{
	description = "EKS_Name"
	type = string 
  default = "terraform2"
}

variable "k8s_version"{
	description = "k8s_vr"
	type = string 
  default = "1.2.1"
}

variable "vpc_id"{
	description = "vpc id from the another module"
	type = string
}

variable "private_subnets"{
	description = "private subnet"
	type = list(string)  
}

variable "public_subnets" {
	description = "public_subnet"
	type = list(string)
}

#variable "cluster_addons" {
#  type = any
#}
