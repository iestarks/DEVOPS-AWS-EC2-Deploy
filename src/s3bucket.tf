resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket"
  acl    = "private"
 region = "us-east-1"
  versioning {
    enabled = true
  }
}
