resource "aws_iam_policy_attachment" "policy-attach" {
  name = "test-attachment"
  roles = [aws_iam_role.ec2-cf-role.name]
  policy_arn = aws_iam_policy.ec2-cf-policy.arn
}

