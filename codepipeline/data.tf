data "aws_codecommit_repository" "cp-source" {
  repository_name = var.cc-repository-name
}
