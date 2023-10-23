resource "aws_instance" "MyfirstEC2instance_Terraform" {
    
    ami =   "ami-09cb21a1e29bcebf0"
    instance_type = "t2.micro"
    key_name = "demokey"
    tags = {
      Name = "MyfirstEC2instance_Terraform"
    }
    provisioner "local-exec" {
        
    command = "echo ${aws_instance.MyfirstEC2instance_Terraform.private_ip} >> private_ip.txt" 
}
}


resource "aws_eip" "myeip" {
  instance = "${aws_instance.MyfirstEC2instance_Terraform.id}"
}

output "my_eip" {
  value = "${aws_eip.myeip.public_ip}"
}


resource "null_resource" "ec2-ssh-connection" {
    connection {
          host        = "${aws_eip.myeip.public_ip}"
          type        = "ssh"
          port        = 22
          user        = "ec2-user"
          private_key = file("/Users/robinpaul/Downloads/demokey.pem")
          timeout     = "1m"
          agent       = false
        }
    provisioner "file" {
        # cp index.html ec2-user@eip:/var/index.html
        source      = "index.html"
        destination = "/home/ec2-user/index.html"
      }
    provisioner "remote-exec" {
      
          inline = [
          "sudo yum update -y",
          "sudo yum install -y httpd",
          "sudo systemctl start httpd.service",
          "sudo systemctl enable httpd.service",
          "sudo cp /home/ec2-user/index.html /var/www/html/index.html",
       ]
      }
}


# remote_exec