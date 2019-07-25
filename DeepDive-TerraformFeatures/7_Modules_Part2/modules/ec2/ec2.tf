resource "aws_instance" "myec2_forwebapp" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  #ec2 is running in custom subnet which is in a custom vpc , 
  #attaching this ec2 to a sg which is default and part of default vpc wont work
  
  #security_groups = ["default"]
  subnet_id = "${var.subnet_id}"
  tags = {
      Name = "${var.ec2_name}"
  }
  availability_zone = "${var.availability_zone}"
}
