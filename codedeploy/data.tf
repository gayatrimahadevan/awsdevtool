data "aws_autoscaling_group" "asg-spot-with-lt" {
  name = "asg-nlb"
}
data "aws_lb_target_group" "tg-mynlb" {
  name = "tg-mynlb"
}
