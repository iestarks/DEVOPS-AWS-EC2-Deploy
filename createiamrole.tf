resource "aws_iam_role" "ec2-cf-role" {
  name = "ec2-cf-role"
  assume_role_policy = file("assumerolepolicy.json")
}

