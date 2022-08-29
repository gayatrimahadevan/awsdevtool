# AWS Autoscaling Group Configuation without ELB
resource "aws_autoscaling_group" "asg-spot-with-lt" {
  name                = "asg-nlb"
  min_size            = 2
  max_size            = 4
  vpc_zone_identifier = tolist(data.aws_subnets.public.ids)
  launch_template {
    id      = aws_launch_template.ec2-lt-public.id
    version = "$Latest"
  }
}
