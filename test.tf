# Configure the AWS Provider

provider "aws" {
  region = "eu-central-1"

}

resource "aws_instance" "ubuntu" {
ami = "ami-0cc0a36f626a4fdf5"
count = 2
instance_type = "t2.micro"
key_name = "EP"
tags = {
        Name = "ubuntu_1"
        Group = "prod"

    }
}

resource "aws_instance" "ubuntu2" {
ami = "ami-0cc0a36f626a4fdf5"
instance_type = "t2.micro"
key_name = "EP"
tags = {
        Name = "ubuntu_2"
        Group = "prod"

    }
}
