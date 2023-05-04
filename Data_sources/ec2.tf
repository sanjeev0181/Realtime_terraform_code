data "aws_ami" "ubuntu-linux-2004" {
  executable_users = ["self"]
  most_recent      = true
  owners           = ["521045274894"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
 
}


resource "aws_instance" "linux-server" {
  ami = data.aws_ami.ubuntu-linux-2004.id
  instance_type = "t2.micro"
  key_name = ajith-keys
}


