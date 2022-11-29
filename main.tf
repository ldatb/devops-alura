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

resource "aws_security_group" "learning-devops-security-group" {
  name = "learning-devops-security-group"
  ingress{
    cidr_blocks = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = [ "::/0" ]
    from_port = 0
    to_port = 0
    protocol = "-1"
  }
  egress{
    cidr_blocks = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = [ "::/0" ]
    from_port = 0
    to_port = 0
    protocol = "-1"
  }
  tags = {
    Name = "learning-devops-security-group"
  }
}

resource "aws_instance" "learning-devops-instance" {
  ami = "ami-09a41e26df464c548"
  instance_type = "t2.micro"
  key_name = "learning-terraform"

  #  user_data = <<-EOF
  #    #!/bin/bash
  #    cd ~
  #    sudo apt-get update && sudo apt-get -y install busybox
  #    echo "<h1>Ola mundo</h1><h2>Feito com o Terraform</h2>" > index.html
  #    nohup busybox httpd -f -p 8080 &
  #  EOF

  tags = {
    Name = "DevOps-Alura-AWS"
  }
}

output "ip_addr" {
  value = aws_instance.learning-devops-instance.public_ip
}
