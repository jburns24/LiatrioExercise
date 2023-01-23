# Kind of like node attributes in chef. Place where you can define
# user managed variables.

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}
