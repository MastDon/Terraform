provider "aws" {
    region = "eu-central-1"
}

resource "aws_security_group" "web_server" {
name = "web_server"
description = "OPen ports for webserver and ssh"

ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
  
ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]

}
}

}

resource "aws_instance" "web" {
    ami = "ami-0cc0a36f626a4fdf5"
    count = 1
    vpc_security_group_ids = [aws_security_group.web_server.id]
    
    instance_type = "t2.micro"
    key_name = "key"
    user_data = <<EOF
#!/bin/bash
apt update -y
apt -y install apache2
ip a > /var/www/index.html
sudo systemctl start apache2
sudo systemctl enable apache2
EOF
    tags = {
        Name = "webserver"
        Group = "test"

    }
  
}



