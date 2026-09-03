variable "node_name"{
        description = "Node_Name"
        type = string 
  	default = "terraform2-node-role"
}

variable "Effect"{
        description = "Effect_Value"
        type = string 
  	default = "Allow"
}

variable "Service"{
        description = "Service_Value"
        type = string 
  	default = "ec2.amazonaws.com"
}
