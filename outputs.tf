output "vpc_id_output" {
  description = "The ID of the VPC."
  value       = aws_cloudformation_stack.oe_patterns_wordpress.outputs["VpcIdOutput"]
}

output "vpc_private_subnet1_id_output" {
  description = "The ID of the first private VPC subnet."
  value       = aws_cloudformation_stack.oe_patterns_wordpress.outputs["VpcPrivateSubnet1IdOutput"]
}

output "vpc_private_subnet2_id_output" {
  description = "The ID of the second private VPC subnet."
  value       = aws_cloudformation_stack.oe_patterns_wordpress.outputs["VpcPrivateSubnet2IdOutput"]
}

output "vpc_public_subnet1_id_output" {
  description = "The ID of the first public VPC subnet."
  value       = aws_cloudformation_stack.oe_patterns_wordpress.outputs["VpcPublicSubnet1IdOutput"]
}

output "vpc_public_subnet2_id_output" {
  description = "The ID of the second public VPC subnet."
  value       = aws_cloudformation_stack.oe_patterns_wordpress.outputs["VpcPublicSubnet2IdOutput"]
}

output "dns_site_url_output" {
  description = "The URL Endpoint."
  value       = aws_cloudformation_stack.oe_patterns_wordpress.outputs["DnsSiteUrlOutput"]
}

output "source_artifact_bucket_name_output" {
  description = "The source artifact S3 bucket name that is monitored for updates to be deployed"
  value       = aws_cloudformation_stack.oe_patterns_wordpress.outputs["SourceArtifactBucketNameOutput"]
}

output "source_artifact_object_key_output" {
  description = "The source artifact S3 object key that is monitored for updates to be deployed"
  value       = aws_cloudformation_stack.oe_patterns_wordpress.outputs["SourceArtifactObjectKeyOutput"]
}

output "first_use_instructions" {
  description = "Instructions for getting started."
  value       = aws_cloudformation_stack.oe_patterns_wordpress.outputs["FirstUseInstructions"]
}
