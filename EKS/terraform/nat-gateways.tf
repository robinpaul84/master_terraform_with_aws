
# Resource: aws_nat_gateway
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway

#nat gateways allow private instances in private subnetwork to connect to internet
#nat gateway translates private ip addresses to public ip addresses
resource "aws_nat_gateway" "gw1" {
  # The Allocation ID of the Elastic IP address for the gateway.
  allocation_id = aws_eip.nat1.id

  # The Subnet ID of the subnet in which to place the gateway.
  subnet_id = aws_subnet.public_1.id

  # A map of tags to assign to the resource.
  tags = {
    Name = "NAT 1"
  }
  depends_on = [ 
    aws_eip.nat1,
    aws_subnet.public_1 
    ]
}

resource "aws_nat_gateway" "gw2" {
  # The Allocation ID of the Elastic IP address for the gateway.
  allocation_id = aws_eip.nat2.id

  # The Subnet ID of the subnet in which to place the gateway.
  subnet_id = aws_subnet.public_2.id

  # A map of tags to assign to the resource.
  tags = {
    Name = "NAT 2"
  }

  depends_on = [ 
    aws_eip.nat2,
    aws_subnet.public_2 
    ]
}
