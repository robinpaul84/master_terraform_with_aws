resource "aws_instance" "myec2_forwebapp" {
  ami = var.ami
  instance_type = var.instance_type
  security_groups = ["default"]
  tags = {
      Name = var.ec2_name
  }
  availability_zone = var.availability_zone
}
