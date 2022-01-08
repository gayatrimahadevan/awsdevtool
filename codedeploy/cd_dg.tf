resource "aws_codedeploy_deployment_group" "cd-dg" {
  app_name              = aws_codedeploy_app.cd-server.name
  deployment_group_name = "cd_dg"
  service_role_arn      = aws_iam_role.cd-service-role.arn


  trigger_configuration {
    trigger_events = ["DeploymentFailure", "DeploymentSuccess", "DeploymentFailure", "DeploymentStop",
    "InstanceStart", "InstanceSuccess", "InstanceFailure"]
    trigger_name       = "event-trigger"
    trigger_target_arn = aws_sns_topic.cd-update.arn
  }

  auto_rollback_configuration {
    enabled = false
    events  = ["DEPLOYMENT_FAILURE"]
  }

  alarm_configuration {
    alarms  = ["my-alarm-name"]
    enabled = true
  }

  load_balancer_info {
    target_group_info {
      name = data.aws_lb_target_group.tg-mynlb.name
    }
  }

  deployment_style {
    deployment_option = "WITH_TRAFFIC_CONTROL"
    deployment_type   = "IN_PLACE"
  }

  autoscaling_groups = [data.aws_autoscaling_group.asg-spot-with-lt.id]
}
