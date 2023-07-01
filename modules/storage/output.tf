output "ingest_bucket_arn" {
  value = aws_s3_bucket.ingest.arn
}

output "ingest_bucket_name" {
  value = aws_s3_bucket.ingest.id
}
