resource "aws_s3_bucket" "ingest" {
  bucket = "s3-${var.project}-${var.organization}-${var.environment}"
  tags   = var.tags
}

resource "aws_s3_bucket_public_access_block" "ingest_public_access_block" {
  bucket                  = aws_s3_bucket.ingest.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
