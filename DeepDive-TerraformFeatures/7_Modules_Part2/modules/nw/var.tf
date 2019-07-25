variable "cidr_vpc" {
    default = "192.168.0.0/16"
   # 192.168.0.0 - 192.168.255.255
}

variable "cidr_instance_tenancy" {
    default = "dedicated"
  
}

variable "vpc_id" {
  default = {}
}

variable "cidr_subnet" {
    #192.168.1.0 - 192.168.1.255
    default = "192.168.1.0/24"
}

variable "az" {
  default = "us-east-1e"
}




