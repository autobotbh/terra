# vpc creation
resource "aws_vpc" "my_vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"
  

  tags = {
    Name = "my-vpc"
  }
}


# subnet creation


resource "aws_subnet" "subnets" {
    count = length(var.subnet_cidr_block)
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr_block[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
   map_public_ip_on_launch = true  
  tags = {
    Name = var.subnet_names[count.index]    
  }
}



# internet gateway creation

resource "aws_internet_gateway" "egw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "egw"
  }
}

# egress only internet gateway creation

resource "aws_egress_only_internet_gateway" "eiw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "eiw"
  }
}
# route table creation
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.egw.id
  }
   route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.eiw.id
  }

  tags = {
    Name = "my-rt"
  }
}



# route table association

resource "aws_route_table_association" "a" {
    count = length(var.subnet_cidr_block)
  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.rt.id   
} 