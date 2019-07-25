resource "aws_instance" "ec2_created_by_robin" {
  ami = "ami-0b898040803850657"
  instance_type = "t2.nano"
  tags = {
      Name = "ec2_created_by_robin"
  }

}

resource "aws_instance" "ec2_created_by_paul_manually" {
  ami = "ami-0b898040803850657"
  instance_type = "t2.nano"
  tags = {
      Name = "ec2_created_by_paul_now_imported_successfully"
  }
}



