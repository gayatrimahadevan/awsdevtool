resource "aws_sns_topic" "cc_update" {
  name = "cc-update-topic"
}
resource "aws_sns_topic_subscription" "cc_updates_sms_target" {
  topic_arn = aws_sns_topic.cc_update.arn
  protocol  = "sms"
  endpoint  = "+919110767625"
}
resource "aws_sns_topic_subscription" "cc_updates_email_target" {
  topic_arn = aws_sns_topic.cc_update.arn
  protocol  = "email"
  endpoint  = "gayatri.mahadevan@gmail.com"
}
