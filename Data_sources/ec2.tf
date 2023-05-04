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
  key_name = ajith_keys
}

#https://stackoverflow.com/questions/60757334/git-push-from-visual-studio-code-no-anonymous-write-access-authentication-fai
#git remote set-url origin https://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@github.com/sanjeev0181/Devops-roboshop-project.git