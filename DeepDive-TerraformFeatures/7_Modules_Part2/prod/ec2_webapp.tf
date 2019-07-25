module "my_vpc" {
  source = "../modules/nw"
  cidr_vpc = "10.0.0.0/16"
  cidr_instance_tenancy = "default"
  vpc_id = "${module.my_vpc.vpc_id}"
  cidr_subnet = "10.0.1.0/24"
  
}

module "my_ec2" {
    source = "../modules/ec2"
    instance_type = "t2.large"
    ec2_name = "my_prod_EC2"
    subnet_id = "${module.my_vpc.subnet_id}"
}
