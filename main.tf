terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.region
}

locals {
  name = "${terraform.workspace}-instance"
}

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
 

  tags = {
    Name = local.name
  }
}
