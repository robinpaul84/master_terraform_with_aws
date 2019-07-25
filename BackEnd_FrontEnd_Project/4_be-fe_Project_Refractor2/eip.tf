resource "aws_eip" "fe_eip" {
  instance = "${aws_instance.my_ec2s[0].id}"
}
