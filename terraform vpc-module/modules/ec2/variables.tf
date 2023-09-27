variable "sg_id" {
    description = "The ID of the security group"
    type = string
  
}

variable "subnets" {
    description = "subnet for ec2 instance"
    type = list(string)
  
}
variable "ec2_names" {
  description = "value for ec2 instance"
    type = list(string)
    default = [ "webserver1", "webserver2" ]
}