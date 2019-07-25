resource "aws_instance" "front_end_ec2" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  tags = {
      Name = "ec2_frontend"
  }
  subnet_id = "${var.subnetid}"
  vpc_security_group_ids = ["${aws_security_group.allow_http_only.id}"]
  
}

resource "aws_instance" "back_end_ec2" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  tags = {
      Name = "ec2_backend"
  }
  subnet_id = "${var.subnetid}"
  vpc_security_group_ids = ["${aws_security_group.allow_http_only.id}"]
  
}

