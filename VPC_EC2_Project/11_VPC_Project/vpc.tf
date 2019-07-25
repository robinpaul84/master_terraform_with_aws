resource "aws_vpc" "mainvpc" {
  cidr_block            = "10.0.0.0/16"
  instance_tenancy      = "default"
  enable_dns_hostnames  = true

  tags = {
      Name = "VPC_TF"
  }

}

resource "aws_security_group" "allow_ssh" {
    name        = "allow_ssh"
    description = "Allow SSH inbound traffic/ Allow all outbound traffic"
    vpc_id      = "${aws_vpc.mainvpc.id}"

    ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    }

    tags = {
        Name = "SecurityGroup_TF"
    }

    depends_on = ["aws_vpc.mainvpc"]
}

resource "aws_internet_gateway" "IGW_TF" {
  vpc_id = "${aws_vpc.mainvpc.id}"

  tags = {
    Name = "IGW_TF"
  }
  depends_on = ["aws_vpc.mainvpc"]
}

resource "aws_eip" "EIP" {
  vpc              = true
  tags = {
    Name = "EIP"
  }

}

resource "aws_nat_gateway" "NATGW" {
    allocation_id = "${aws_eip.EIP.id}"
    subnet_id = "${aws_subnet.PublicSubnet_A.id}"

    tags = {
        Name  = "NATGW"
    }
    depends_on = ["aws_eip.EIP","aws_subnet.PublicSubnet_A"]
  
}

