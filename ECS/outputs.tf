# outputs.tf

# output "ecr_image_url" {
#   value = aws_ecr_repository.ecr_lab.repository_url
# }

output "alb_hostname" {
  value = aws_alb.main.dns_name
}

