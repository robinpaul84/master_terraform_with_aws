resource "aws_instance" "PublicEC2" {
  ami =   "${var.ami}"
  instance_type = "${var.instance_type}"
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  subnet_id = "${aws_subnet.PublicSubnet_A.id}"
  key_name = "ec2_keypair"
  tags = {
    Name = "PublicEC2"
  }
  depends_on = ["aws_vpc.mainvpc","aws_subnet.PublicSubnet_A","aws_security_group.allow_ssh"]
}

resource "aws_instance" "PrivateEC2" {
  ami =   "${var.ami}"
  instance_type = "${var.instance_type}"
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  subnet_id = "${aws_subnet.PrivateSubnet_A.id}"
  key_name = "ec2_keypair"
  tags = {
    Name = "PrivateEC2"
  }
  depends_on = ["aws_vpc.mainvpc","aws_subnet.PrivateSubnet_A","aws_security_group.allow_ssh"]
}
