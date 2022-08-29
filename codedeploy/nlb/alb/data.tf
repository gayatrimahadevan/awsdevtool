data "aws_autoscaling_group" "asg-spot-with-lt" {
  name = "asg-nlb"
}
data "aws_security_group" "lb-sg" {
  name = "allow-web"
}
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
