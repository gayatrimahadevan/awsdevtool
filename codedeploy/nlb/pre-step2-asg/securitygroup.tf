locals {
  ifconfig_co_json = jsondecode(data.http.my_public_ip.body)
}
resource "aws_security_group" "allow-ssh" {
  vpc_id      = data.aws_vpc.dev-vpc.id
  name        = "allow-ssh"
  description = "security group that allows ssh and all egress traffic"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${local.ifconfig_co_json.ip}/32", data.aws_vpc.dev-vpc.cidr_block]
  }
  tags = {
    Name         = "sg-allow-ssh",
    "AllowedUse" = "Internal"
  }
}
resource "aws_security_group" "allow-web" {
  vpc_id      = data.aws_vpc.dev-vpc.id
  name        = "allow-web"
  description = "security group that allows web and all egress traffic"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name         = "sg-allow-web",
    "AllowedUse" = "Internal"
  }
}
resource "aws_security_group" "allow-lb" {
  vpc_id      = data.aws_vpc.dev-vpc.id
  name        = "allow-lb"
  description = "security group that allows web and all egress traffic"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.dev-vpc.cidr_block]
  }
  tags = {
    Name         = "sg-allow-lb",
    "AllowedUse" = "Internal"
  }
}
