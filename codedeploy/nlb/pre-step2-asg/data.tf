data "aws_vpc" "dev-vpc" {
  filter {
    name   = "tag:Name"
    values = ["dev-vpc"]
  }
}
data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.dev-vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["dev-vpc-private"] # insert values here
  }
}
data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.dev-vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["dev-vpc-public"] # insert values here
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["codedeploy-java"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["self"] # Current AWS account
}
data "http" "my_public_ip" {
  url = "https://ifconfig.co/json"
  request_headers = {
    Accept = "application/json"
  }
}
