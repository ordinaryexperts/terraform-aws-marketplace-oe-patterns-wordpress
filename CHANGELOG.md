# Unreleased

# 3.1.0

* Update to OE WordPress Pattern version 3.1.0 - WordPress 7.0.2 (was 6.9.4). No CloudFormation parameter changes; `template_url` updated to the new Marketplace-hosted version.

# 3.0.0

* Update to OE WordPress Pattern version 3.0.0 - WordPress 6.9.4, Aurora MySQL 8.0, EFS-backed wp-content, optional NLB SFTP. See the pattern repo CHANGELOG for breaking changes (notably the AMI parameter rename to `AsgAmiIdv300`, which means existing 2.x stacks cannot be updated in place).

# 2.1.0

* Update to OE WordPress Pattern version 2.1.0 - WordPress version 6.7.2
* Adding EnableSftp parameter
* Adding SftpIngressCidr parameter

# 2.0.1

* Adding AsgKeyName variable

# 2.0.0

* Update to OE Pattern version 2.0.0 - WordPress version 6.6.1
* Add tests

# 0.1.1

* Update to WordPress product version 1.4.1 - still testing

# 0.1.0

* Initial module development
