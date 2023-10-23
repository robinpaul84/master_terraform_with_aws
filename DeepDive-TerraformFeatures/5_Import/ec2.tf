resource "aws_instance" "MyFirstEc2instance_from_terraform-EIP_demo1" {
  ami = "ami-09cb21a1e29bcebf0"
  instance_type = "t2.micro"
  tags = {
      Name = "EC2started_from_console_from_terraform_EIP_DEMO"
  }
  key_name = "testkey"

}

/*

resource "aws_instance" "ec2_created_by_paul_manually" {
  ami = "ami-0b9094fa2b07038b8"
  instance_type = "t2.micro"
  tags = {
      Name = "EC2FROMPAUL1"
  }
  key_name = "testkey"

}
*/
