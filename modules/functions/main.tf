data "archive_file" "lambda" {
  type        = "zip"
  source_dir  = "${path.module}/lambda"
  output_path = "${path.module}/lambda.zip"
}



resource "aws_iam_role" "role_for_lambda" {
  name               = "role-for-lambda-${var.project}-${var.environment}"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
  tags               = var.tags
}

resource "aws_iam_role_policy" "policy_for_lambda" {
  name   = "policy-for-lambda-${var.project}-${var.environment}"
  role   = aws_iam_role.role_for_lambda.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "dyanmodb:*",
      "Effect": "Allow",
      "Resource": "${var.customer_table_arn}"
    },{
      "Action": "s3:*",
      "Effect": "Allow",
      "Resource": "${var.ingest_bucket_arn}}"
    }
  ]
}
EOF
}

resource "aws_lambda_function" "lambda" {
  filename         = "${path.module}/lambda.zip"
  function_name    = "customer-${var.project}-${var.environment}"
  role             = aws_iam_role.role_for_lambda.arn
  handler          = "main.lambda_handler"
  runtime          = "python3.8"
  timeout          = 300
  tags             = var.tags
  source_code_hash = filebase64sha256("${path.module}/lambda.zip")
  environment {
    variables = {
      CUSTOMER_TABLE = var.customer_table_name
      ENVIRONMENT    = var.environment
    }
  }
  depends_on = [
    aws_iam_role_policy.policy_for_lambda
  ]
}

resource "aws_lambda_permission" "invoke_from_bucket" {
  statement_id  = "AllowExecutionFromS3"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.arn
  principal     = "s3.amazonaws.com"
  source_arn    = var.ingest_bucket_arn
  depends_on = [
    aws_lambda_function.lambda
  ]
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = var.ingest_bucket_name
  lambda_function {
    lambda_function_arn = aws_lambda_function.lambda.arn
    events              = ["s3:ObjectCreated:*"]
    filter_suffix       = ".json"
  }
  depends_on = [
    aws_lambda_permission.invoke_from_bucket
  ]
}

