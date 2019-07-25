resource "aws_instance" "Myec2"{
    count = "${length(var.availability_zone)}"
      ami = "${var.ami}"
      instance_type = "${var.instance_type}"
      availability_zone = "${element(var.availability_zone, count.index)}"
      tags = {
          Name = "MyEC2_${element(var.availability_zone, count.index)}"
      }
}
output "Myec2" {
  value = "${aws_instance.Myec2}"
}
