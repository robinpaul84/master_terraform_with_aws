variable "region" {
  
}

variable "vpc_cidr" {
    
}

variable "instance_type" {
  default  = "t2.micro"
}

variable "ami" {
  default = "ami-0b898040803850657"
  
}

variable "public_subnet_cidr" {
  type = "list"
  
}

variable "private_subnet_cidr" {
  type = "list"
}

variable "availability_zone" {
  type = "list"
}

variable "public_subnet_names" {
  type = "list"
  
}

variable "private_subnet_names" {
  type = "list"
  
}

