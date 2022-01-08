resource "aws_codedeploy_app" "cd-server" {
  compute_platform = "Server"
  name             = "cd-server-app"
}
