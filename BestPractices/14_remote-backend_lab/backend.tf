terraform {
  backend "s3" {
    #Code for uploading .tfstate to Remote s3 bucket
    #Name of s3 bucket you created
    bucket = "remote-backend-demo-terraform"
    key    = "remotedemo.tfstate"
    region = "us-east-1"
    #you have to mention keys here , it wont work if you put in providers.tf - open bug with terraform
    access_key = "Paste your access key here"
    secret_key = "Paste your secret key here"

    # Code to lock the remote .tfstate
    #To lock the remote state file in S3 bucket , create a dynamodb table
    # and create a primary key 'LockID'
    dynamodb_table = "statelock_table_dynamo"
  }
}

#https://www.terraform.io/docs/backends/types/s3.html