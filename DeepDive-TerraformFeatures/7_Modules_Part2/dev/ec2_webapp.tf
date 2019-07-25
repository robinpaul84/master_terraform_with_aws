module "my_vpc" {
  source = "../modules/nw"
  cidr_vpc = "192.168.0.0/16"
  cidr_instance_tenancy = "default"
  vpc_id = "${module.my_vpc.vpc_id}"
  cidr_subnet = "192.168.1.0/24"
  
}

module "my_ec2" {
    source = "../modules/ec2"
    instance_type = "t2.nano"
    ec2_name = "my_devEC2"
    subnet_id = "${module.my_vpc.subnet_id}"
}
