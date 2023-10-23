resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "terraform-s3-bucket-xxxxx"
  //acl    = "public-read"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}