output "instance" {
    description = "The ID of the EC2 instance"
    value = aws_instance.web.*.id
  
}
  
