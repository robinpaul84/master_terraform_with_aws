resource "aws_eip" "myEIP" {
  domain   =   "vpc"
}

output "ec2_public_ip" {
  value = "${aws_eip.myEIP.public_ip}"
}
    
    


