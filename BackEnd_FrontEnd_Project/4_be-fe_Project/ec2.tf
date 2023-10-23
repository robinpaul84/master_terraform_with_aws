resource "aws_instance" "front_end_ec2" {
  ami = "ami-09cb21a1e29bcebf0"
  instance_type = "t2.micro"
  tags = {
      Name = "ec2_frontend"
  }
  subnet_id = "subnet-02561f643a450c0ce"
  vpc_security_group_ids = ["${aws_security_group.allow_http_only.id}"]
  
}

resource "aws_instance" "back_end_ec2" {
  ami = "ami-09cb21a1e29bcebf0"
  instance_type = "t2.micro"
  tags = {
      Name = "ec2_backend"
  }
  subnet_id = "subnet-02561f643a450c0ce"
  vpc_security_group_ids = ["${aws_security_group.allow_http_only.id}"]
  
}

