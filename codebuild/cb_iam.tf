data "aws_iam_policy_document" "cb-assume-role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      identifiers = ["codebuild.amazonaws.com"]
      type        = "Service"
    }
  }
}
resource "aws_iam_role" "cb-service-role" {
  assume_role_policy = data.aws_iam_policy_document.cb-assume-role.json
  name               = "cb-service-role"
}
resource "aws_iam_role_policy" "cb-service-role-policy" {
  role   = aws_iam_role.cb-service-role.name
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Resource": "*",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:*"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Resource": "*",
      "Action": [
         "codecommit:GitPull"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
         "codebuild:CreateReportGroup",
         "codebuild:CreateReport",
         "codebuild:UpdateReport",
         "codebuild:BatchPutTestCases",
         "codebuild:BatchPutCodeCoverages"
      ],
      "Resource": "*"
    }
  ]
}
POLICY
}
