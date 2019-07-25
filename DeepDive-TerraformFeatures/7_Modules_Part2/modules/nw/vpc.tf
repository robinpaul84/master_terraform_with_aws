resource "aws_vpc" "my_vpc" {
  cidr_block = "${var.cidr_vpc}"
  instance_tenancy = "${var.cidr_instance_tenancy}"
  tags = {
      Name = "Custom Vpc"
  }
}

resource "aws_subnet" "my_subnet" {
    vpc_id = "${var.vpc_id}"
    cidr_block = "${var.cidr_subnet}"
    tags = {
        Name = "Subnet-module-demo"
    }
    availability_zone = "${var.az}"
    depends_on = ["aws_vpc.my_vpc"]
}

#This way prod/ec2_Webapp.tf can access this variables and pass it to vpc creation 
#prod/ec2_webapp.tf line5
output "vpc_id" {
  value = "${aws_vpc.my_vpc.id}"
}

#This way prod/ec2_Webapp.tf can access this variables and pass it to subnet creation 
#prod/ec2_webapp.tf line14
output "subnet_id" {
  value = "${aws_subnet.my_subnet.id}"
}

