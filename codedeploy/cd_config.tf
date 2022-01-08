resource "aws_codedeploy_deployment_config" "cd-config" {
  deployment_config_name = "cd-deployment-config"

  minimum_healthy_hosts {
    type  = "HOST_COUNT"
    value = 0
  }
}
