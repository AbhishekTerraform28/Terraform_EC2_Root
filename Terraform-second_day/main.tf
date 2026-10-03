

provider "aws" {

  region = "eu-north-1"

}


resource "aws_security_group" "allow_ssh" {

  name        = "allow_ssh"

  description = "Allow SSH inbound traffic"



  ingress {

    description = "SSH from anywhere"

    from_port   = 22

    to_port     = 22

    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }



  egress {

    from_port   = 0

    to_port     = 0

    protocol    = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

}



resource "aws_instance" "my_ec2" {
  ami                         = "ami-01e082ac2f79f3918"
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  associate_public_ip_address = true

# user_data ko yahan aws_instance ke andar hona chahiye
  user_data = file("${path.module}/scripts/setup.sh")
  user_data_replace_on_change = true

 tags = {
    Name = "terraform-lab"
  }
}