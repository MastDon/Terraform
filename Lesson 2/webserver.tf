provider "aws" {
    region = "eu-central-1"
}


resource "aws_instance" "web" {
    ami = "ami-0cc0a36f626a4fdf5"
    count = 1
    instance_type = "t2.micro"
    key_name = "EP"
    tags = {
        Name = "ubuntu_1"
        Group = "prod"

    }
  
}
