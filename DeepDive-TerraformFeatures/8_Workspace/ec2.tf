resource "aws_instance" "myec2" {
  ami = var.ami
  instance_type = lookup(var.instance_type, terraform.workspace)
  tags = {
      Name = lookup(var.ec2_name, terraform.workspace)
  }
  availability_zone = var.availability_zone
}
