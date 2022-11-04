terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 1.3.2"
}

provider "aws" {
  profile = "default"
  region = "us-east-1"
}

resource "aws_instance" "learning-terraform" {
  ami = "ami-00266f51b6b22db58"
  instance_type = "t2.micro"

  tags = {
    Name = "Aprendendo-Terraform"
  }
}