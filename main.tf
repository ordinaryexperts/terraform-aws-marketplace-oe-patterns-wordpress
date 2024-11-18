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

  template_url = "https://s3.amazonaws.com/awsmp-fulfillment-cf-templates-prod/f3bfa640-c230-4a34-9c4a-91d4a98f9a2e.204b7a2ce3934313b5c5d82c83c0cc96.template"

  capabilities = ["CAPABILITY_NAMED_IAM"]

  parameters = {
    AlbCertificateArn                  = var.alb_certificate_arn
    AlbIngressCidr                     = var.alb_ingress_cidr
    AsgDesiredCapacity                 = var.asg_desired_capacity
    AsgInstanceType                    = var.asg_instance_type
    AsgMaxSize                         = var.asg_max_size
    AsgMinSize                         = var.asg_min_size
    AsgReprovisionString               = var.asg_reprovision_string
    CustomWpConfigParameterArn         = var.custom_wp_config_parameter_arn
    DbBackupRetentionPeriod            = var.db_backup_retention_period
    DbInstanceClass                    = var.db_instance_class
    DbSecretArn                        = var.db_secret_arn
    DbSnapshotIdentifier               = var.db_snapshot_identifier
    DnsHostname                        = var.dns_hostname
    DnsRoute53HostedZoneName           = var.dns_route53_hosted_zone_name
    EfsAutomaticBackupsStatus          = var.efs_automatic_backups_status
    EfsTransitionToIa                  = var.efs_transition_to_ia
    EfsTransitionToPrimaryStorageClass = var.efs_transition_to_primary_storage_class
    SesCreateDomainIdentity            = var.ses_create_domain_identity
    SesInstanceUserAccessKeySerial     = var.ses_instance_user_access_key_serial
    VpcCidr                            = var.vpc_cidr
    VpcId                              = var.vpc_id
    VpcNatGatewayPerSubnet             = var.vpc_nat_gateway_per_subnet
    VpcPrivateSubnet1Cidr              = var.vpc_private_subnet1_cidr
    VpcPrivateSubnet1Id                = var.vpc_private_subnet1_id
    VpcPrivateSubnet2Cidr              = var.vpc_private_subnet2_cidr
    VpcPrivateSubnet2Id                = var.vpc_private_subnet2_id
    VpcPublicSubnet1Cidr               = var.vpc_public_subnet1_cidr
    VpcPublicSubnet1Id                 = var.vpc_public_subnet1_id
    VpcPublicSubnet2Cidr               = var.vpc_public_subnet2_cidr
    VpcPublicSubnet2Id                 = var.vpc_public_subnet2_id
    WordPressArn                       = var.wordpress_arn
  }
}
