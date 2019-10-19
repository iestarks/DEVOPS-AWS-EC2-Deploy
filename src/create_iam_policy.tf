resource "aws_iam_policy" "ec2-cf-policy" {
  description = "A test policy"
  policy      = "${file("policy_ec2.json")}"
}

