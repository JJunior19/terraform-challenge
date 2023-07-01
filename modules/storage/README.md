<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.ingest](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.ingest_public_access_block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | The environment to deploy | `string` | `"dev"` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | The organization to deploy | `string` | `"zurich"` | no |
| <a name="input_project"></a> [project](#input\_project) | The project to deploy | `string` | `"ingest"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region to deploy | `string` | `"eu-west-1"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags to apply to all resources | `map(string)` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ingest_bucket_arn"></a> [ingest\_bucket\_arn](#output\_ingest\_bucket\_arn) | n/a |
| <a name="output_ingest_bucket_name"></a> [ingest\_bucket\_name](#output\_ingest\_bucket\_name) | n/a |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->