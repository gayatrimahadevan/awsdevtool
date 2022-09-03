#AWS Code Pipeline Role
resource "aws_iam_role" "cp-service-role" {
  name = "cp-service-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": ["codepipeline.amazonaws.com","events.amazonaws.com"]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

  tags = {
    Name = "cp-service-role"
  }

}
resource "aws_iam_role_policy" "cp-role-policy" {
  role = aws_iam_role.cp-service-role.name

  policy = <<POLICY
{
    "Statement": [
        {
            "Action": [
                "chatbot:DescribeSlackChannelConfigurations",
                "codepipeline:*",
                "cloudformation:DescribeStacks",
                "cloudformation:ListChangeSets",
                "cloudtrail:CreateTrail",
                "cloudtrail:DescribeTrails",
                "cloudtrail:GetEventSelectors",
                "cloudtrail:PutEventSelectors",
                "cloudtrail:StartLogging",
                "codebuild:BatchGetProjects",
                "codebuild:CreateProject",
                "codebuild:ListCuratedEnvironmentImages",
                "codebuild:ListProjects",
                "codebuild:StartBuild",
                "codebuild:BatchGetBuilds",
                "codecommit:GetBranch",
                "codecommit:GetRepositoryTriggers",
                "codecommit:ListBranches",
                "codecommit:ListRepositories",
                "codecommit:PutRepositoryTriggers",
                "codecommit:GetReferences",
		"codecommit:GetCommit",
                "codecommit:UploadArchive",
                "codecommit:GetUploadArchiveStatus",
		"codedeploy:CreateDeployment",
        	"codedeploy:GetApplication",
		"codedeploy:GetApplicationRevision",
                "codedeploy:BatchGetApplications",
		"codedeploy:GetDeployment",
		"codedeploy:GetDeploymentConfig",
                "codedeploy:GetDeploymentGroup",
                "codedeploy:BatchGetDeploymentGroups",
                "codedeploy:ListApplications",
                "codedeploy:ListDeploymentGroups",
		"codedeploy:RegisterApplicationRevision",
                "devicefarm:GetDevicePool",
                "devicefarm:GetProject",
                "devicefarm:ListDevicePools",
                "devicefarm:ListProjects",
                "ec2:DescribeSecurityGroups",
                "ec2:DescribeSubnets",
                "ec2:DescribeVpcs",
                "ecr:DescribeRepositories",
                "ecr:ListImages",
                "ecs:ListClusters",
                "ecs:ListServices",
                "elasticbeanstalk:DescribeApplications",
                "elasticbeanstalk:DescribeEnvironments",
                "iam:ListRoles",
                "iam:GetRole",
                "lambda:GetFunctionConfiguration",
                "lambda:ListFunctions",
                "events:ListRules",
                "events:ListTargetsByRule",
                "events:DescribeRule",
                "opsworks:DescribeApps",
                "opsworks:DescribeLayers",
                "s3:CreateBucket",
                "s3:PutObject",
                "s3:GetObject",
                "s3:ListBucket",
                "s3:GetBucketPolicy",
                "s3:PutObjectAcl",
                "s3:GetBucketVersioning",
                "s3:ListAllMyBuckets",
                "s3:PutBucketPolicy",
                "s3:GetObjectVersion",
		"sns:ListTopics",
		"sns:CreateTopic",
                "sns:SetTopicAttributes",
                "states:ListStateMachines",
		"sns:Publish"
            ],
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Action": [
                "iam:PassRole"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:iam::*:role/service-role/cwe-role-*"
            ],
            "Condition": {
                "StringEquals": {
                    "iam:PassedToService": [
                        "events.amazonaws.com"
                    ]
                }
            }
        },
        {
            "Action": [
                "iam:PassRole"
            ],
            "Effect": "Allow",
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "iam:PassedToService": [
                        "codepipeline.amazonaws.com"
                    ]
                }
            }
        },
        {
            "Action": [
                "events:PutRule",
                "events:PutTargets",
                "events:DeleteRule",
                "events:DisableRule",
                "events:RemoveTargets"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:events:*:*:rule/codepipeline-*"
            ]
        },
        {
            "Sid": "CodeStarNotificationsReadWriteAccess",
            "Effect": "Allow",
            "Action": [
                "codestar-notifications:CreateNotificationRule",
                "codestar-notifications:DescribeNotificationRule",
                "codestar-notifications:UpdateNotificationRule",
                "codestar-notifications:DeleteNotificationRule",
                "codestar-notifications:Subscribe",
                "codestar-notifications:Unsubscribe"
            ],
            "Resource": "*",
            "Condition": {
                "StringLike": {
                    "codestar-notifications:NotificationsForResource": "arn:aws:codepipeline:*"
                }
            }
        }
    ],
    "Version": "2012-10-17"
}
POLICY
}
