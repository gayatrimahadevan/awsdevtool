variable "cp-output-s3" {
  description = "Bucket for codepipeline output."
  type        = string
  default     = "cp-output-20220117"
}
variable "cc-repository-name" {
  description = "Name of code commit Repository."
  default     = "demorep"

}
variable "approve-comment" {
  description = "Comment for manual Approval."
  default     = "Comment for manual Approval."
  type        = string
}
variable "cb-project-name" {
  description = "Name of code build project."
  default     = "cb-demo"
  type        = string
}
variable "cd-dg-name" {
  description = "Name of code deploy Deployment group."
  default     = "cd-dg"
  type        = string
}
variable "cd-app-name" {
  description = "Name of code deploy Application."
  default     = "cd-server-app"
  type        = string
}
