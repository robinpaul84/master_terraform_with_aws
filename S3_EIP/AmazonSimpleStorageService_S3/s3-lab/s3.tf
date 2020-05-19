resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "terraform-s3-bucket-19-05-2019"
  acl    = "public-read"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}