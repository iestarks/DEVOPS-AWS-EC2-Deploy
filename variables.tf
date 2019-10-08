provider "aws" {
  access_key = ""
  secret_key = ""
  skip_credentials_validation = true
  skip_requesting_account_id = true
  skip_metadata_api_check = true
}

variable "region" {
  default = "us-east-1"
}

variable "code"{
type = "map"
default = { 
        us-east-1 = "ami-0dbbd6f952e12feba"
}
description = "Test EC2 build for us-east-1"
}