terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.51.0"
    }
  }
}
locals {
  environment  = "local"
  region       = "eu-west-1"
  organization = "zurich"
  project      = "ingest"
  tags = {
    Environment  = local.environment
    Project      = local.project
    Organization = local.organization
  }
}
provider "aws" {
  region                      = local.region
  access_key                  = "test"
  secret_key                  = "test"
  s3_force_path_style         = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    iam            = "http://localhost:4566"
    s3             = "http://s3.localhost.localstack.cloud:4566"
    lambda         = "http://localhost:4566"
    dynamodb       = "http://localhost:4566"
    cloudwatchlogs = "http://localhost:4566"
  }
}

module "storage" {
  source = "../../modules/storage"

  environment  = local.environment
  region       = local.region
  organization = local.organization
  project      = local.project
  tags         = local.tags
}

module "database" {
  source = "../../modules/database"

  environment  = local.environment
  region       = local.region
  organization = local.organization
  project      = local.project
  tags         = local.tags
}

module "functions" {
  source = "../../modules/functions"

  environment         = local.environment
  region              = local.region
  organization        = local.organization
  project             = local.project
  tags                = local.tags
  ingest_bucket_arn   = module.storage.ingest_bucket_arn
  customer_table_arn  = module.database.customer_table_arn
  ingest_bucket_name  = module.storage.ingest_bucket_name
  customer_table_name = module.database.customer_table_name
  depends_on = [
    module.storage,
    module.database,
  ]
}
