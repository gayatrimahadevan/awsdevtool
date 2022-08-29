# Required Providers
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}
# Configure the AWS Provider
provider "aws" {
  alias  = "useast1"
  region = "us-east-1"
}
