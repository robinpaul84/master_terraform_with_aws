# ecs.tf

resource "aws_ecs_cluster" "main" {
  name = "lab-cluster"
  tags = {
      Name = "ecs_demo_terraform_course"
  }
  
}

data "template_file" "web-app" {
  template = file("./templates/ecs/web_app.json.tpl")

  vars = {
    app_image      = var.app_image //aws_ecr_repository.ecr_lab.repository_url
    app_port       = var.app_port
    fargate_cpu    = var.fargate_cpu
    fargate_memory = var.fargate_memory
    aws_region     = var.aws_region
  }

}

resource "aws_ecs_task_definition" "app" {
  family                   = "web-app-task"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory
  container_definitions    = data.template_file.web-app.rendered

  depends_on = [aws_cloudwatch_log_stream.web_app_log_stream]
}

resource "aws_ecs_service" "main" {
  name            = "lab-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = var.app_count
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = [aws_security_group.ecs_tasks.id]
    subnets          = aws_subnet.private.*.id
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.app.id
    container_name   = "web-app"
    container_port   = var.app_port
  }


  depends_on = [aws_alb_listener.front_end, aws_iam_role_policy_attachment.ecs_task_execution_role]
}

