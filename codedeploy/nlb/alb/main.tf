resource "aws_lb" "nlb" {
  name                             = "my-nlb"
  load_balancer_type               = "application"
  subnets                          = tolist(data.aws_subnets.public.ids)
  internal                         = false
  idle_timeout                     = 60
  enable_cross_zone_load_balancing = true
  enable_deletion_protection       = false
  security_groups                  = [data.aws_security_group.lb-sg.id]
}

resource "aws_lb_target_group" "tg-mynlb" {
  name       = "tg-mynlb"
  vpc_id     = data.aws_vpc.dev-vpc.id
  port       = 9090
  protocol   = "HTTP"
  depends_on = [aws_lb.nlb]
  health_check {
    path                = var.healthcheck-path
    port                = 9090
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 2
    interval            = 5
    matcher             = "200"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener" "tcp-listener" {
  load_balancer_arn = aws_lb.nlb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_lb_target_group.tg-mynlb.arn
    type             = "forward"
  }
}

#CreateanewALBTargetGroupattachment

resource "aws_autoscaling_attachment" "asg-tg-attach" {
  autoscaling_group_name = data.aws_autoscaling_group.asg-spot-with-lt.id
  lb_target_group_arn   = aws_lb_target_group.tg-mynlb.arn
}
