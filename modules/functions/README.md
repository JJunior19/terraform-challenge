<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.log_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_policy.lambda_logging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.role_for_lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.policy_for_lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.lambda_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_function.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_lambda_permission.invoke_from_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_s3_bucket_notification.bucket_notification](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_notification) | resource |
| [archive_file.lambda](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_customer_table_arn"></a> [customer\_table\_arn](#input\_customer\_table\_arn) | The ARN of the customer table | `string` | n/a | yes |
| <a name="input_customer_table_name"></a> [customer\_table\_name](#input\_customer\_table\_name) | The name of the customer table | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment to deploy | `string` | `"dev"` | no |
| <a name="input_ingest_bucket_arn"></a> [ingest\_bucket\_arn](#input\_ingest\_bucket\_arn) | The ARN of the ingest bucket | `string` | n/a | yes |
| <a name="input_ingest_bucket_name"></a> [ingest\_bucket\_name](#input\_ingest\_bucket\_name) | The name of the ingest bucket | `string` | n/a | yes |
| <a name="input_organization"></a> [organization](#input\_organization) | The organization to deploy | `string` | `"zurich"` | no |
| <a name="input_project"></a> [project](#input\_project) | The project to deploy | `string` | `"ingest"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region to deploy | `string` | `"eu-west-1"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags to apply to all resources | `map(string)` | n/a | yes |
## Outputs

No outputs.
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->