resource "aws_cloudwatch_event_rule" "cwe-cp-cc" {
  name        = "cwe-cp-cc"
  description = "Amazon CloudWatch Events rule to automatically start your pipeline when a change occurs in the AWS CodeCommit source repository and branch."

  event_pattern = <<EOF
{
	"source": ["aws.codecommit"],
	"detail-type": ["CodeCommit Repository State Change"],
	"resources": ["${data.aws_codecommit_repository.cp-source.arn}"],
	"detail": {
		"event": ["referenceCreated", "referenceUpdated"],
		"referenceType": ["branch"],
		"referenceName": ["main"]
	}
}
EOF
}
