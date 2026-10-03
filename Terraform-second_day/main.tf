provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-01e082ac2f79f3918"
  instance_type = "t3.micro"

  tags = {
    Name = "terraform-lab"
  }
}