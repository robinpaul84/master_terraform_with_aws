variable "ami" {
    default = "ami-0b898040803850657"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "subnetid" {
  default = "subnet-0a58e322b90bc6790"
}

variable "ec2s" {
  type="list"
  default = ["ec2_fe","ec2_be"]
}
