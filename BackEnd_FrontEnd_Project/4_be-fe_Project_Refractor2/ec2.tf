resource "aws_instance" "my_ec2s" {
  count = "${length(var.ec2s)}"
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  tags = {
      Name = "webapp_${element(var.ec2s, count.index)}"
  }
  subnet_id = "${var.subnetid}"
  vpc_security_group_ids = ["${aws_security_group.allow_http_only.id}"]
  
}

# resource "aws_instance" "back_end_ec2" {
#   ami = "${var.ami}"
#   instance_type = "${var.instance_type}"
#   tags = {
#       Name = "ec2_backend"
#   }
#   subnet_id = "${var.subnetid}"
#   vpc_security_group_ids = ["${aws_security_group.allow_http_only.id}"]
  
# }

