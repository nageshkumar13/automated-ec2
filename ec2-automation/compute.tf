resource "aws_instance" "ec2_9_5" {
  ami = "ami-00fa32593b478ad6e" # Amazon Linux 2023 AMI, ap-south-1
  instance_type = "t2.micro"
  tags = {
    Name = "EC2 9to5"
    WorkingHoursFlag = "True"
  }
}

resource "aws_instance" "ec2_24_7" {
  ami = "ami-00fa32593b478ad6e" # Amazon Linux 2023 AMI, eu-west-3
  instance_type = "t2.micro"
  tags = {
    Name = "EC2 24h"
    WorkingHoursFlag = "False"
  }
}