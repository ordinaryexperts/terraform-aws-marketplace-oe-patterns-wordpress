variable "stack_name" {
  type        = string
  description = "Name of the CloudFormation stack"
  default     = "oe_patterns_wordpress"
}

variable "vpc_id" {
  type        = string
  description = "Optional: Specify the VPC ID. If not specified, a VPC will be created."
  default     = ""
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "Optional: VPC IPv4 CIDR block if no VPC provided."
}

variable "vpc_nat_gateway_per_subnet" {
  type        = string
  default     = false
  description = "Optional: Set to 'true' to provision a NAT Gateway in each public subnet for AZ HA."
}

variable "vpc_private_subnet1_id" {
  type        = string
  default     = ""
  description = "Optional: Specify Subnet ID for private subnet 1."
}

variable "vpc_private_subnet1_cidr" {
  type        = string
  default     = "10.0.128.0/18"
  description = "Optional: VPC IPv4 CIDR block of private subnet 1 if no VPC provided."
}

variable "vpc_private_subnet2_id" {
  type        = string
  default     = ""
  description = "Optional: Specify Subnet ID for private subnet 2."
}

variable "vpc_private_subnet2_cidr" {
  type        = string
  default     = "10.0.192.0/18"
  description = "Optional: VPC IPv4 CIDR block of private subnet 2 if no VPC provided."
}

variable "vpc_public_subnet1_id" {
  type        = string
  default     = ""
  description = "Optional: Specify Subnet ID for public subnet 1."
}

variable "vpc_public_subnet1_cidr" {
  type        = string
  default     = "10.0.0.0/18"
  description = "Optional: VPC IPv4 CIDR block of public subnet 1 if no VPC provided."
}

variable "vpc_public_subnet2_id" {
  type        = string
  default     = ""
  description = "Optional: Specify Subnet ID for public subnet 2."
}

variable "vpc_public_subnet2_cidr" {
  type        = string
  default     = "10.0.64.0/18"
  description = "Optional: VPC IPv4 CIDR block of public subnet 2 if no VPC provided."
}

variable "dns_route53_hosted_zone_name" {
  type        = string
  default     = ""
  description = "Optional: Route 53 Hosted Zone name. Must already exist and match the domain part of the Hostname parameter, without trailing dot."
}

variable "dns_hostname" {
  type        = string
  default     = ""
  description = "Optional: The hostname to access the service."
}

variable "ses_instance_user_access_key_serial" {
  type        = string
  default     = "1"
  description = "Optional: Incrementing this integer value will trigger a rotation."
}

variable "ses_create_domain_identity" {
  type        = bool
  default     = true
  description = "Optional: If 'true', a SES Domain Identity will be created from the hosted zone."
}

variable "db_secret_arn" {
  type        = string
  default     = ""
  description = "Optional: SecretsManager secret ARN for database credentials. If not specified, a secret will be created."
}

variable "db_backup_retention_period" {
  description = "Required: The number of days to retain automated db backups."
  type        = number
  default     = 7
}

variable "db_instance_class" {
  description = "Required: The class profile for memory and compute capacity for the database instance."
  type        = string
  default     = "db.t4g.medium"
}

variable "db_snapshot_identifier" {
  description = "Optional: RDS snapshot ARN from which to restore."
  type        = string
  default     = ""
}

variable "asg_instance_type" {
  description = "Required: The EC2 instance type for the application Auto Scaling Group."
  type        = string
  default     = "t3.micro"
}

variable "asg_key_name" {
  description = "Optional: The EC2 key pair name for the instance."
  type        = string
  default     = ""
}

variable "asg_reprovision_string" {
  description = "Optional: Changes to this parameter will force instance reprovision on the next CloudFormation update."
  type        = string
  default     = ""
}

variable "asg_desired_capacity" {
  description = "Required: The desired capacity of the Auto Scaling Group."
  type        = number
  default     = 1
}

variable "asg_max_size" {
  description = "Required: The maximum size of the Auto Scaling Group."
  type        = number
  default     = 2
}

variable "asg_min_size" {
  description = "Required: The minimum size of the Auto Scaling Group."
  type        = number
  default     = 1
}

variable "efs_automatic_backups_status" {
  description = "Optional: status of automatic backups of EFS."
  type        = string
  default     = "ENABLED"
  validation {
    condition     = contains(["ENABLED", "DISABLED"], var.efs_automatic_backups_status)
    error_message = "Valid value is one of the following: ENABLED, DISABLED."
  }
}

variable "efs_transition_to_ia" {
  description = "Describes the period of time that a file is not accessed, after which it transitions to IA storage. Metadata operations such as listing the contents of a directory don't count as file access events."
  type        = string
  default     = ""
  validation {
    condition     = contains(["", "AFTER_7_DAYS", "AFTER_14_DAYS", "AFTER_30_DAYS", "AFTER_60_DAYS", "AFTER_90_DAYS"], var.efs_transition_to_ia)
    error_message = "Valid value is one of the following: '', AFTER_7_DAYS, AFTER_14_DAYS, AFTER_30_DAYS, AFTER_60_DAYS, AFTER_90_DAYS."
  }
}

variable "efs_transition_to_primary_storage_class" {
  description = "Describes when to transition a file from IA storage to primary storage. Metadata operations such as listing the contents of a directory don't count as file access events."
  type        = string
  default     = ""
  validation {
    condition     = contains(["", "AFTER_1_ACCESS"], var.efs_transition_to_primary_storage_class)
    error_message = "Valid value is one of the following: '', AFTER_1_ACCESS."
  }
}

variable "custom_wp_config_parameter_arn" {
  description = "Optional: ARN of SSM Parameter Store Secure String containing custom PHP code to put into wp-config.php."
  default     = ""
  type        = string
}

variable "wordpress_arn" {
  description = "Optional: Secrets Manager Secret ARN used to store WordPress credentials. If not specified, a secret will be created."
  type        = string
  default     = ""
}

variable "alb_certificate_arn" {
  description = "Required: Specify the ARN of a ACM Certificate to configure HTTPS."
  type        = string
}

variable "alb_ingress_cidr" {
  description = "Required: VPC IPv4 CIDR block to restrict access to ALB."
  type        = string
}
