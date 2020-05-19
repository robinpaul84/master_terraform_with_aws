resource "aws_subnet" "PublicSubnet_A" {
  vpc_id     = aws_vpc.mainvpc.id
  cidr_block = var.public_subnet_cidr
  availability_zone = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet_A"
  }
  depends_on = [aws_vpc.mainvpc]
}

resource "aws_subnet" "PrivateSubnet_A" {
  vpc_id     = aws_vpc.mainvpc.id
  cidr_block = var.private_subnet_cidr
  availability_zone = var.availability_zone
  

  tags = {
    Name = "PrivateSubnet_A"
  }
  depends_on = [aws_vpc.mainvpc]
}