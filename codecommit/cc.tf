resource "aws_codecommit_repository" "demo" {
  repository_name = var.repository-name
  description     = var.description
  default_branch  = "main"
}
