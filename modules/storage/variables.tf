variable "environment" {
  description = "The environment to deploy"
  type        = string
  default     = "dev"
}

variable "region" {
  description = "The region to deploy"
  type        = string
  default     = "eu-west-1"
}

variable "organization" {
  description = "The organization to deploy"
  type        = string
  default     = "zurich"
}

variable "project" {
  description = "The project to deploy"
  type        = string
  default     = "ingest"
}

variable "tags" {
  description = "The tags to apply to all resources"
  type        = map(string)
}
