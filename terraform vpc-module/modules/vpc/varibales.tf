variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type = string
}

variable "subnet_cidr_block" {
  description = "The CIDR block for the subnets"
  type = list(string)
}
  
variable "subnet_names" {
  description = "The names for the subnets"
  type = list(string)
  default = [ "Publicsubnet1", "Publicsubnet2" ]
}  
