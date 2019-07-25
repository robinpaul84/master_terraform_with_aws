resource "aws_eip" "fe_eip" {
  instance = "${aws_instance.front_end_ec2.id}"
}
