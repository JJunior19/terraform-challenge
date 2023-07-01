output "customer_table_name" {
  value = aws_dynamodb_table.customer_table.id
}

output "customer_table_arn" {
  value = aws_dynamodb_table.customer_table.arn
}

