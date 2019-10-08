provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "role-test" {
  ami                  = "ami-0dbbd6f952e12feba"
  instance_type        = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.test_profile.name
  key_name             = "ansiblekey"

  tags = {
    Name = "test-instance"
  }
}

