variable "ami" {
  default = "ami-0b898040803850657"
}

variable "instance_type" {
  default = {
      default = "t2.micro",
      prod    = "t2.large",
      dev     = "t2.nano"
  }
}

variable "ec2_name" {
  default = {
      default = "",
      prod    = "prod_ec2_workspace_demo",
      dev     = "dev_ec2_workspace_demo"

  }
}

variable "availability_zone" {
  default = "us-east-1e"
}