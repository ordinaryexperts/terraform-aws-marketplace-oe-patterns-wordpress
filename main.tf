terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
    }
  }
  required_version = ">= 1.0"
}

resource "aws_cloudformation_stack" "oe_patterns_wordpress" {
  name = var.stack_name

  template_url = "https://s3.amazonaws.com/awsmp-fulfillment-cf-templates-prod/f3bfa640-c230-4a34-9c4a-91d4a98f9a2e.002b52ca-436f-4dd0-9e58-1389fc47a598.template"

  capabilities = ["CAPABILITY_NAMED_IAM"]

  parameters = {
    InitializeDefaultWordPress               = var.initialize_default_wordpress
    NotificationEmail                        = var.notification_email
    PipelineArtifactBucketName               = var.pipeline_artifact_bucket_name
    SourceArtifactBucketName                 = var.source_artifact_bucket_name
    SourceArtifactObjectKey                  = var.source_artifact_object_key
    WordPressEnv                             = var.wordpress_env
    VpcId                                    = var.vpc_id
    VpcCidr                                  = var.vpc_cidr
    VpcNatGatewayPerSubnet                   = var.vpc_nat_gateway_per_subnet
    VpcPrivateSubnet1Id                      = var.vpc_private_subnet1_id
    VpcPrivateSubnet1Cidr                    = var.vpc_private_subnet1_cidr
    VpcPrivateSubnet2Id                      = var.vpc_private_subnet2_id
    VpcPrivateSubnet2Cidr                    = var.vpc_private_subnet2_cidr
    VpcPublicSubnet1Id                       = var.vpc_public_subnet1_id
    VpcPublicSubnet1Cidr                     = var.vpc_public_subnet1_cidr
    VpcPublicSubnet2Id                       = var.vpc_public_subnet2_id
    VpcPublicSubnet2Cidr                     = var.vpc_public_subnet2_cidr
    DnsRoute53HostedZoneName                 = var.dns_route53_hosted_zone_name
    DnsHostname                              = var.dns_hostname
    SesCreateDomainIdentity                  = var.ses_create_domain_identity
    DbSecretArn                              = var.db_secret_arn
    DbBackupRetentionPeriod                  = var.db_backup_retention_period
    DbInstanceClass                          = var.db_instance_class
    DbSnapshotIdentifier                     = var.db_snapshot_identifier
    AsgInstanceType                          = var.asg_instance_type
    AsgReprovisionString                     = var.asg_reprovision_string
    AsgDesiredCapacity                       = var.asg_desired_capacity
    AsgMaxSize                               = var.asg_max_size
    AsgMinSize                               = var.asg_min_size
    EfsAutomaticBackupsStatus                = var.efs_automatic_backups_status
    EfsTransitionToIa                        = var.efs_transition_to_ia
    EfsTransitionToPrimaryStorageClass       = var.efs_transition_to_primary_storage_class
    AlbCertificateArn                        = var.alb_certificate_arn
    AlbIngressCidr                           = var.alb_ingress_cidr
  }
}
