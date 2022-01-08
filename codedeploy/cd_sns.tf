resource "aws_sns_topic" "cd-update" {
  name = "cd-update-topic"
}
resource "aws_sns_topic_subscription" "cd-update-sms-target" {
  topic_arn = aws_sns_topic.cd-update.arn
  protocol  = "sms"
  endpoint  = "+919110767625"
}
resource "aws_sns_topic_subscription" "cd-update-email-target" {
  topic_arn = aws_sns_topic.cd-update.arn
  protocol  = "email"
  endpoint  = "gayatri.mahadevan@gmail.com"
}
