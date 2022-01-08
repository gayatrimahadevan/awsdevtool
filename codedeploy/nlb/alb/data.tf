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
data "aws_subnet_ids" "private" {
  vpc_id = data.aws_vpc.dev-vpc.id
  filter {
    name   = "tag:Name"
    values = ["dev-vpc-private"] # insert values here
  }
}
data "aws_subnet_ids" "public" {
  vpc_id = data.aws_vpc.dev-vpc.id
  filter {
    name   = "tag:Name"
    values = ["dev-vpc-public"] # insert values here
  }
}

