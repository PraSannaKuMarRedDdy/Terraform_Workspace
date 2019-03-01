# Resource for VPC
resource "aws_vpc"  "dev_env" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags {
        Name = "dev_env"
    }
}

#Resource for Subnets
resource "aws_subnet" "public-dev-1"{
     vpc_id = "${aws_vpc.dev_env.id}"
     cidr_block = "10.0.1.0/24"
     map_public_ip_on_launch = "true"
     availability_zone = "ap-south-1a"

     tags {
         Name = "public-dev-1"
     }
}

resource "aws_subnet" "public-dev-2" {
      vpc_id = "${aws_vpc.dev_env.id}"
     cidr_block = "10.0.2.0/24"
     map_public_ip_on_launch = "true"
     availability_zone = "ap-south-1b"

     tags {
         Name = "public-dev-2"
     }
}

resource "aws_subnet" "private-dev-1" {
      vpc_id = "${aws_vpc.dev_env.id}"
     cidr_block = "10.0.3.0/24"
     map_public_ip_on_launch = "true"
     availability_zone = "ap-south-1a"

     tags {
         Name = "private-dev-1"
     }
}

resource "aws_subnet" "private-dev-2" {
     vpc_id = "${aws_vpc.dev_env.id}"
     cidr_block = "10.0.4.0/24"
     map_public_ip_on_launch = "true"
     availability_zone = "ap-south-1b"

     tags {
         Name = "private-dev-2"
     }
}

# Resource Internet Gateway

resource "aws_internet_gateway" "dev_IGW" {
	   vpc_id = "${aws_vpc.dev_env.id}"
	   tags {
	     Name = "dev_IGW"
	   }
}

#Resource for Route Table
resource "aws_route_table" "dev_RT" {
	 vpc_id = "${aws_vpc.dev_env.id}"
	 route {
	       cidr_block = "0.0.0.0/0"
	       gateway_id = "${aws_internet_gateway.dev_IGW.id}"
	 }
	 tags {
	      Name = "dev_RT"
	 }
}

#Resource for route table association 
resource "aws_route_table_association" "dev_RT-1" {
	subnet_id = "${aws_subnet.public-dev-1.id}"
	route_table_id = "${aws_route_table.dev_RT.id}"
}
resource "aws_route_table_association" "dev_RT-2" {
	subnet_id = "${aws_subnet.public-dev-2.id}"
	route_table_id = "${aws_route_table.dev_RT.id}"
}
