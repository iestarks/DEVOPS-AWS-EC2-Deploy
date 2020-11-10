resource "aws_instance" "aws_ec2_testinstance" {
  ami                  = "${lookup(var.code, var.region)}"
  instance_type        = "t2.micro"
  iam_instance_profile = "${aws_iam_instance_profile.aws_ec2_profile.name}"
  key_name             = "ansiblekey"

  tags = {
    Name = "aws_ec2_oc_instance"
  }
}
