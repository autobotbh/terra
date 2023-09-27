variable "sg_id" {
    type = string
    description = "Security Group ID"
  
}

variable "subnets" {
    type = list(string)
    description = "Subnets ID"
  
}
  
variable "vpc_id" {
    type = string
    description = "VPC ID"
  
}

variable "instance" {
    type = list(string)
    description = "AWS Instance ID"
  
}
  