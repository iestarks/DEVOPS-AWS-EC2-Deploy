resource "aws_iam_instance_profile" "aws_iam_ec2_profile" {                             
name  = "aws_iam_ec2_profile"                         
role = aws_iam_role.ec2-cf-role.name
}

