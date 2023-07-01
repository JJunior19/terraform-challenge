resource "aws_dynamodb_table" "customer_table" {
  name         = "customer-${var.environment}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"
  tags         = var.tags
  attribute {
    name = "id"
    type = "S"
  }
}
