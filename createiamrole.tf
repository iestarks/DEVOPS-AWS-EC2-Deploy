resource "aws_iam_role" "aws_iam_role.test_role.name" {
  name = "test_role"
  assume_role_policy = file("policyec2_cloudformation.json")
}

