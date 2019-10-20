terraform {
  backend "s3" {
    bucket = "terraform-bucket-irving"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
