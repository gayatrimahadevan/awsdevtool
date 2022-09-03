resource "aws_cloudwatch_event_target" "cp-cwe-target" {
  arn      = aws_codepipeline.cp.arn
  rule     = aws_cloudwatch_event_rule.cwe-cp-cc.id
  role_arn = aws_iam_role.cp-service-role.arn
}
