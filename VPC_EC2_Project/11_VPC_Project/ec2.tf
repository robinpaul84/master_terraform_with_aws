resource "aws_instance" "PublicEC2" {
  ami =   "ami-04cb4ca688797756f"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  subnet_id = "${aws_subnet.PublicSubnet_A.id}"
  key_name = "testkey"
  tags = {
    Name = "PublicEC2"
  }
  depends_on = [aws_vpc.mainvpc,aws_subnet.PublicSubnet_A,aws_security_group.allow_ssh]
}

resource "aws_instance" "PrivateEC2" {
  ami =   "ami-04cb4ca688797756f"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  subnet_id = "${aws_subnet.PrivateSubnet_A.id}"
  key_name = "testkey"
  tags = {
    Name = "PrivateEC2"
  }
  depends_on = [aws_vpc.mainvpc,aws_subnet.PrivateSubnet_A,aws_security_group.allow_ssh]
}
