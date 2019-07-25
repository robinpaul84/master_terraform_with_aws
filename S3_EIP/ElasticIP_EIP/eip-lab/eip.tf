 resource "aws_eip" "my_first_eip" {
  instance = "${aws_instance.MyFirstEc2instance_from_terraform-EIP_demo.id}"
  vpc      = true
}

output "my_eip_address" {
  value = "${aws_eip.my_first_eip.public_ip}"
}
