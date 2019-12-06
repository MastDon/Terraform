provider "aws" {
    region = "eu-central-1"
}


resource "aws_instance" "web" {
    ami = "ami-0cc0a36f626a4fdf5"
    count = 1
    
    instance_type = "t2.micro"
    key_name = "EP"
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



