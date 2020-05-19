How to run:

terraform init
terraform workspace new dev
terraform workspace list
terraform workspace select dev
terraform apply --auto-approve
terraform destroy --auto-approve

terraform workspace new prod
terraform workspace list
terraform workspace select prod
terraform apply --auto-approve
terraform destroy --auto-approve

