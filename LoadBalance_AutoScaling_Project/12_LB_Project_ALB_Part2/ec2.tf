resource "aws_instance" "PublicEC2" {
  count = "${length(var.public_subnet_cidr)}"
  ami =   "${var.ami}"
  instance_type = "${var.instance_type}"
  vpc_security_group_ids = ["${aws_security_group.ec2_public_security_group.id}"]
  subnet_id = "${aws_subnet.public_subnets[count.index].id}"
  key_name = "ec2_keypair"
  tags = {
    Name = "${format("PublicEC2-%d", count.index+1)}"
  }
  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd.service
                systemctl enable httpd.service
                echo "Hi Friend I am public EC2!!!! : $(hostname -f)" > /var/www/html/index.html
                EOF
  depends_on = ["aws_vpc.mainvpc","aws_subnet.public_subnets","aws_security_group.ec2_public_security_group"]
}

resource "aws_instance" "PrivateEC2" {
  count = "${length(var.private_subnet_cidr)}"
  ami =   "${var.ami}"
  instance_type = "${var.instance_type}"
  vpc_security_group_ids = ["${aws_security_group.ec2_private_security_group.id}"]

  subnet_id = "${aws_subnet.private_subnets[count.index].id}"
  key_name = "ec2_keypair"
  tags = {
    Name = "${format("PrivateEC2-%d", count.index+1)}"
  }
  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd.service
                systemctl enable httpd.service
                echo "Hi Friend I am private EC2!!!! : $(hostname -f)" > /var/www/html/index.html
                EOF
  depends_on = ["aws_vpc.mainvpc","aws_subnet.private_subnets","aws_security_group.ec2_private_security_group"]
}
