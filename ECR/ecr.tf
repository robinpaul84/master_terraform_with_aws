resource "aws_ecr_repository" "ecr_lab" {
  name                 = "ecr-repo-for-tf-lab"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
      Name = "ecs_demo_terraform_course"
  }
}
