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


# variable "code" {
# type = map
# default = { 
#         us-east-1 = "ami-098f16afa9edf40be"
# }
# description = "OC master for us-east-1"
# }


//resource "aws_subnet" "starks_vpc_subnet" {
  //vpc_id            = "${data.aws_vpc.selected.id}"
  //availability_zone = "us-east-1a"
  //cidr_block        = "${cidrsubnet(data.aws_vpc.selected.cidr_block, 4, 1)}"
//}

# variable "oc_sg" {
#   description = "The ID of one or more security groups to associate with the network interface for storage group id"
#   type        = list(string)
#   default     = []
# }

variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = "oc-vpc"
}


# variable "vpc_id" {
#   description = "ID of the VPC where to create security group"
#   type        = string
#   default = ""
# }


 variable "subnet_id" {
   description = "The VPC Subnet ID to launch in"
   type        = string
   default     = ""
 }

 variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = null
}