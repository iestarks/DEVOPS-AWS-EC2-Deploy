resource "aws_instance" "test-instance" {
  ami                  = "${lookup(var.code, var.region)}"
  instance_type        = "t2.micro"
  iam_instance_profile = "${aws_iam_instance_profile.test_profile.name}"
  key_name             = "ansiblekey"

  tags = {
    Name = "test-instance"
  }
}
