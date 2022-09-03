resource "aws_codepipeline" "cp" {
  name     = "first-pipeline"
  role_arn = aws_iam_role.cp-service-role.arn

  artifact_store {
    location = aws_s3_bucket.cp-output.bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeCommit"
      version          = "1"
      output_artifacts = ["source_output"]
      region           = "us-east-1"
      namespace        = "SourceVariables"
      configuration = {
        RepositoryName       = data.aws_codecommit_repository.cp-source.repository_name
        BranchName           = "main"
        PollForSourceChanges = "false"
        OutputArtifactFormat = "CODE_ZIP"
      }
    }
  }
  stage {
    name = "Approve"

    action {
      name     = "Approval"
      category = "Approval"
      owner    = "AWS"
      provider = "Manual"
      version  = "1"

      configuration = {
        NotificationArn = aws_sns_topic.cp-update.arn
        CustomData      = var.approve-comment
      }
    }
  }
  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
      configuration = {
        ProjectName = var.cb-project-name
      }
    }
  }

  #stage {
  #  name = "Deploy"

  #  action {
  #    name            = "Deploy"
  #    category        = "Deploy"
  #    owner           = "AWS"
  #    provider        = "CodeDeploy"
  #    version         = "1"

  #    configuration = {
  #      ApplicationName     = var.cd-app-name 
  #      DeploymentGroupName = var.cd-dg-name
  #    }
  #    output_artifacts  = []
  #    input_artifacts   = ["build_output"]
  #  }
  #}
}

#resource "aws_codestarconnections_connection" "example" {
#  name          = "example-connection"
#  provider_type = "GitHub"
#}

