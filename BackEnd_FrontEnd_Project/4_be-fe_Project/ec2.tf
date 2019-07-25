resource "aws_instance" "front_end_ec2" {
  ami = "ami-0b898040803850657"
  instance_type = "t2.micro"
  tags = {
      Name = "ec2_frontend"
  }
  subnet_id = "subnet-0a58e322b90bc6790"
  vpc_security_group_ids = ["${aws_security_group.allow_http_only.id}"]
  
}

resource "aws_instance" "back_end_ec2" {
  ami = "ami-0b898040803850657"
  instance_type = "t2.micro"
  tags = {
      Name = "ec2_backend"
  }
  subnet_id = "subnet-0a58e322b90bc6790"
  vpc_security_group_ids = ["${aws_security_group.allow_http_only.id}"]
  
}

