resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "terraform-s3-bucket-16-5-59"
  acl    = "public-read"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}