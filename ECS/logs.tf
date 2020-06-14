# logs.tf

# Set up CloudWatch group and log stream and retain logs for 30 days
resource "aws_cloudwatch_log_group" "web_app_log_group" {
  name              = "/ecs/web-app"
  retention_in_days = 30

  tags = {
      Name = "ecs_demo_terraform_course"
  }
}

resource "aws_cloudwatch_log_stream" "web_app_log_stream" {
  name           = "web-applog-stream"
  log_group_name = aws_cloudwatch_log_group.web_app_log_group.name
  depends_on = [aws_cloudwatch_log_group.web_app_log_group]
}

