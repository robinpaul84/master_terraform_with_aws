resource "aws_eip" "myEIP" {
  vpc   =   true
}

output "ec2_public_ip" {
  value = "${aws_eip.myEIP.public_ip}"
}
    
    


