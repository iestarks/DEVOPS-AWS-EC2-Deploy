
variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

provider "aws" {
        region = "us-east-1"
        access_key = "${var.AWS_ACCESS_KEY}"
        secret_key = "${var.AWS_SECRET_KEY}"
}

resource "aws_instance" "example" {
        ami = "ami-0dbbd6f952e12feba"
        instance_type = "t2.micro"
        iam_instance_profile = "${aws_iam_instance_profile.ec2-role.name}"
        key_name = "ansiblekey"
}

