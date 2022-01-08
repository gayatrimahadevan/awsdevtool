resource "aws_codecommit_trigger" "cc_trigger" {
  repository_name = aws_codecommit_repository.demo.repository_name

  trigger {
    name            = "all"
    events          = ["all"]
    destination_arn = aws_sns_topic.cc_update.arn
  }
}
