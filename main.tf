# resource "aws_instance" "aws_ec2_testinstance" {
#   ami                  = lookup(var.code, var.region)
#   instance_type        = "t2.micro"
#   iam_instance_profile = aws_iam_instance_profile.aws_iam_ec2_profile.name
#   key_name             = "ansiblekey"
#   vpc_security_group_ids = [module.vpc.oc_sg]
#   tags = {
#     Name = "aws_ec2_oc_instance"
#          }
# }


module "oc_vpc" {
  source = "./modules/terraform-aws-vpc"

  name = var.name
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

module "oc_servers_sg" {
  source = "./modules/terraform-aws-security-group"

  name        = "oc_sg"
  description = "Security group for web-server with HTTP ports open within VPC"
  #vpc_id   = var.vpc_id
  vpc_id =  module.oc_vpc.vpc_id

  ingress_cidr_blocks = ["10.0.0.0/16"]
}

# data "aws_instance" "oc_instance"{
#   subnet_id  = aws_instance.oc_instance.subnet_id
# }


# data "aws_security_group" "oc_sg_name_prefix" {
# name_prefix = aws_security_group.oc_sg_name_prefix
# }

module "ec2_cluster" {
  source                 = "./modules/terraform-aws-ec2-instance"
  #version                = "~> 2.0"

  name                   = "oc_ec2_instance"
  instance_count         = 2

  ami                    = "ami-098f16afa9edf40be"
  instance_type          = "t2.micro"
  key_name               = "ansiblekey"
  monitoring             = true
  vpc_security_group_ids = ["sg-0ebe64864dac78e21"]
  #vpc_security_group_ids = data.aws_security_group.oc_sg_name_prefix
  #subnet_id              = data.aws_instance.oc_instance.subnet_id
  subnet_id              = "subnet-0a5056feeb3aabe0c"
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
