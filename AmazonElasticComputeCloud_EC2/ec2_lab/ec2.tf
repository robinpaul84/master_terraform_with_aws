
resource "aws_instance" "MyFirstEc2instance_from_terraform" {
  ami = "ami-09cb21a1e29bcebf0"
  instance_type = "t2.micro"
  tags = {
      Name = "EC2started_from_console_from_terraform"
  }
  key_name = "testkey"
  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd.service
                systemctl enable httpd.service
                echo "Hi Friend , I am $(hostname -f) hosted by Terraform" > /var/www/html/index.html
                EOF
}
 

