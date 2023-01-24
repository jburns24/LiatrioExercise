# Kind of like node attributes in chef. Place where you can define
# user managed variables.

variable "tag" {
  description = "Version of the image you want to apply"
  type        = string
  default     = "v1.0.0"
}
