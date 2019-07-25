resource "aws_launch_configuration" "worker" {
  name_prefix = "Autoscaled_TF-"

  image_id                    = "${var.ami}"
  instance_type               = "${var.instance_type}"
  security_groups             = ["${aws_security_group.elb_security_group.id}"]
  associate_public_ip_address = true
  key_name = "ec2_keypair"
  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd.service
                systemctl enable httpd.service
                echo "Hi Friend I am public EC2 launched from Autoscaling!!!! : $(hostname -f)" > /var/www/html/index.html
                EOF

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "worker" {
  name = "my_asg_tf_${aws_launch_configuration.worker.name}"
  min_size             = 1
  desired_capacity     = 1
  max_size             = 3
  vpc_zone_identifier             = "${aws_subnet.public_subnets.*.id}"
  launch_configuration = "${aws_launch_configuration.worker.name}"
  health_check_type    = "ELB"  
  
  target_group_arns = ["${aws_alb_target_group.alb_front_http.arn}"]
  default_cooldown = 30
  health_check_grace_period = 30
  # Required to redeploy without an outage.
  lifecycle {
    create_before_destroy = true
  }
}
