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

variable "ingest_bucket_arn" {
  description = "The ARN of the ingest bucket"
  type        = string
}

variable "ingest_bucket_name" {
  description = "The name of the ingest bucket"
  type        = string
}

variable "customer_table_arn" {
  description = "The ARN of the customer table"
  type        = string
}
variable "customer_table_name" {
  description = "The name of the customer table"
  type        = string
}
