resource "aws_sns_topic" "cp-update" {
  name = "codepipeline-update-topic"
}
resource "aws_sns_topic_subscription" "cp-update-sms-target" {
  topic_arn = aws_sns_topic.cp-update.arn
  protocol  = "sms"
  endpoint  = "+919110767625"
}
resource "aws_sns_topic_subscription" "cp-update-email-target" {
  topic_arn = aws_sns_topic.cp-update.arn
  protocol  = "email"
  endpoint  = "gayatri.mahadevan@gmail.com"
}
