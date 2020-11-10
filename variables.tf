provider "aws" {
  access_key = ""
  secret_key = ""
  skip_credentials_validation = true
  skip_requesting_account_id = true
  skip_metadata_api_check = true
  region = "us-east-1" 
 }

resource "aws_s3_bucket" "aws_storage" {
  bucket = "irv-s3-terraform-bucket"
  acl = "private"
  versioning {
    enabled = true
  }


}

variable "region" {

default = "us-east-1"

}


variable "code" {
type = "map"
default = { 
        us-east-1 = "ami-04b9e92b5572fa0d1"
}
description = "OC master for us-east-1"
}

//variable "vpc_id" {}

//data "aws_vpc" "selected" {
  //id = "${var.vpc_id}"
//}

//resource "aws_subnet" "starks_vpc_subnet" {
  //vpc_id            = "${data.aws_vpc.selected.id}"
  //availability_zone = "us-east-1a"
  //cidr_block        = "${cidrsubnet(data.aws_vpc.selected.cidr_block, 4, 1)}"
//}




