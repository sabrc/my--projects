terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.59.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
data "aws_ami" "ec2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.20230307.0-x86_64-gp2"]
  }
}


resource "aws_instance" "web" {
  ami           = data.aws_ami.ec2.id
  instance_type = "t2.micro"
  key_name = "sabri.key"
  vpc_security_group_ids = [aws_security_group.kitt.id]
  user_data = file("${path.module}/userdata.sh")


  tags = {
    Name = "HelloWorld"
  }
}

