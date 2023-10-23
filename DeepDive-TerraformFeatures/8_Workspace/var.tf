variable "ami" {
  default = "ami-09cb21a1e29bcebf0"
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
  default = "eu-central-1a"
}