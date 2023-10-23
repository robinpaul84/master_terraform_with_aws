variable "ami" {
    default = "ami-0b898040803850657"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "availability_zone" {
     type = list
    default = ["us-east-1a",
                "us-east-1b",
                "us-east-1c"
            ]
  
}
