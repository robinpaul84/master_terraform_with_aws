resource "aws_route_table" "PublicRouteTable" {
  vpc_id = "${aws_vpc.mainvpc.id}"
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = "${aws_internet_gateway.IGW_TF.id}"
  }
  tags = {
      Name = "PublicRouteTable"
  }
  depends_on = ["aws_vpc.mainvpc","aws_internet_gateway.IGW_TF"]
}


resource "aws_route_table_association" "publicroutetableassociation" {
  count = "${length(var.public_subnet_cidr)}"
  subnet_id      = "${element(aws_subnet.public_subnets.*.id, count.index)}"
  route_table_id = "${aws_route_table.PublicRouteTable.id}"
  depends_on     = ["aws_subnet.public_subnets","aws_route_table.PublicRouteTable"]
}

resource "aws_route_table" "PrivateRouteTable" {
  vpc_id     = "${aws_vpc.mainvpc.id}"
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = "${aws_nat_gateway.NATGW.id}"
  }
  tags = {
    Name = "PrivateRouteTable"
  }
  depends_on = ["aws_vpc.mainvpc","aws_nat_gateway.NATGW"]
}

resource "aws_route_table_association" "privateroutetableassociation" {
  count = "${length(var.private_subnet_cidr)}"
  subnet_id     = "${element(aws_subnet.private_subnets.*.id, count.index)}"
  route_table_id = "${aws_route_table.PrivateRouteTable.id}"
  depends_on = ["aws_subnet.private_subnets","aws_route_table.PrivateRouteTable"]
}

