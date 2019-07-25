resource "aws_eip" "myeip_in_us-east-1" {
  vpc = true
}

resource "aws_eip" "myeip_in_eu-central-1" {
  provider = "aws.frankfurt"
  vpc = true
}

