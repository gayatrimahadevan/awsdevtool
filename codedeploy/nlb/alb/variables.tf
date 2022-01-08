variable "healthcheck-path" {
  description = "Application health check path."
  default     = "/firstapp/actuator/health"
  type        = string
}
