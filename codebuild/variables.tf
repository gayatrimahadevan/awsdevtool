variable "cb-project-name" {
  description = "Name of code build project."
  default     = "cb-demo"
  type        = string
}
variable "cb-output-s3" {
  description = "Bucket for codebuild output."
  type        = string
  default     = "cb-output-20220828"
}
variable "source-url" {
  description = "Source code Repository URL."
  type        = string
  default     = "https://git-codecommit.us-east-1.amazonaws.com/v1/repos/demorep"
}

