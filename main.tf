provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "example" {
  ami = "ami-015f72d56355ebc27"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-example"
  }
}
