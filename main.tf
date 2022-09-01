provider "aws" {
region = terraform.workspace == "default" ? "us-east-2" : "us-west-1"
  access_key="AKIAZ32QFUO4KIEB44LQ"
  secret_key="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"
}

data "aws_ssm_parameter" "linuxAmi" {
name="/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

resource "aws_instance" "ec2-vm" {
ami= data.aws_ssm_parameter.linuxAmi.value
instance_type ="t2.micro"
associate_public_ip_address=true
tags={
Name= "${terraform.workspace}-ec2"
}
}
