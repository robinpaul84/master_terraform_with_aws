# output "vpc" {
#   value = "${aws_vpc.mainvpc}"
# }
output "vpc_id" {
  value = "${aws_vpc.mainvpc.id}"
}

# output "vpc_cidr" {
#   value = "${aws_vpc.mainvpc.cidr_block}"
# }


# output "public_subnet_id" {
#   value = "${aws_subnet.PublicSubnet_A.id}"
# }

# output "private_subnet_id" {
#   value = "${aws_subnet.PrivateSubnet_A.id}"
# }