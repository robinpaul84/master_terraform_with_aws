variable "ami" {
    default = "ami-09cb21a1e29bcebf0"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "subnetid" {
  default = "subnet-02561f643a450c0ce"
}

variable "ec2s" {
  type = list
  default = ["ec2_fe","ec2_be"]
}
