# DEVOPS-AWS-EC2-Deploy
Devops repo

The role.tf provides the role, instance profile and policy needed to create an EC2 instance

The main.tf provides the code for the creation of the Win2019 EC2 instance.

The variable.tf contains variable reference parameters that doesnt change.

To execute the api call to AWS to create the EC2 instance, perform the following from your Terraform working directory.

-- Terraform init
---
-- Terraform plan
---
--- Terraform apply -auto-approve
----
