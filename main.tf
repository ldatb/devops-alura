terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 1.3.2"
}

provider "aws" "aws_provider" {
  profile = "default"
  region = "us-east-1"
}

resource "aws_security_group" "security_group" {
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

resource "aws_launch_template" "launch_template" {
  image_id = "ami-09a41e26df464c548"
  instance_type = "t2.micro"
  key_name = "learning-terraform"
  security_group_names = [ "security_group" ]
  user_data = filebase64("ansible.sh")
  tags = {
    Name = "DevOps-Alura-AWS"
  }
}

resource "aws_autoscaling_group" "autoscaller" {
  availability_zones = [ "${aws_provider.region}a", "${aws_provider.region}b" ]
  name = "autoscalling_group"
  min_size = 1
  max_size = 4
  launch_template {
    id = aws_launch_template.launch_template.id
  }
  target_group_arns = [ aws_lb_target_group.load_balance_target_group.arn ]
}

resource "aws_default_subnet" "subnet_zone_a" {
  availability_zone = "${aws_provider.region}a"
}

resource "aws_default_subnet" "subnet_zone_b" {
  availability_zone = "${aws_provider.region}b"
}

resource "aws_lb" "load_balance" {
  internal = false
  subnets = [aws_default_subnet.subnet_zone_a.id, aws_default_subnet.subnet_zone_b.id]
}

resource "aws_lb_target_group" "load_balance_target_group" {
  name = "target_machines"
  port = "8000"
  protocol = "HTTP"
  vpc_id = aws_default_vpc.default_vpc.id
}

resource "aws_default_vpc" "default_vpc" {}

resource "aws_lb_listener" "load_balance_listener" {
  load_balancer_arn = aws_lb.load_balance.arn
  port = "8000"
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.load_balance_target_group.arn
  }
}

# resource "aws_instance" "learning-devops-instance" {
#   ami = "ami-09a41e26df464c548"
#   instance_type = "t2.micro"
#   key_name = "learning-terraform"

#   #  user_data = <<-EOF
#   #    #!/bin/bash
#   #    cd ~
#   #    sudo apt-get update && sudo apt-get -y install busybox
#   #    echo "<h1>Ola mundo</h1><h2>Feito com o Terraform</h2>" > index.html
#   #    nohup busybox httpd -f -p 8080 &
#   #  EOF

#   tags = {
#     Name = "DevOps-Alura-AWS"
#   }
# }
# output "ip_addr" {
#   value = aws_instance.learning-devops-instance.public_ip
# }
