resource "aws_codebuild_project" "cb" {
  name             = var.cb-project-name
  description      = "Spring Boot API demo"
  service_role     = aws_iam_role.cb-service-role.arn

  artifacts {
    type           = "S3"
    namespace_type = "NONE"
    location       = aws_s3_bucket.cb_output.bucket
    name           = var.cb-project-name
    packaging      = "ZIP"
  }
  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:5.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
  }
  source {
    type            = "CODECOMMIT"
    location        = var.source-url
  }
  source_version = "refs/heads/master"
}
