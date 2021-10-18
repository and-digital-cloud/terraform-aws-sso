# SSO Module

Module assigns permissions to groups based on allowed access level split into admin, read only and view only.
Permissions are based on the managed admin, read only and view only policies within AWS and are added to in the iam-policies.tf file to customise access as required.
Groups should already be synced to AWS from AD. Users are managed from within the AD setup.


## Requirements

|Name|Version|
|-|-|
|AWS|~> 3.54|
|Terraform|~> 1.0|

## Input Variables
|Name|Type|Default|Required|Description|
|-|-|-|-|-|
|`account_id`|`string`|N/A|Yes|The account ID that users and groups will be added to|
|`admin_groups`|`map(string)`|{}|No|The map of groups with admin privileges to add to SSO, key/value pair eg <domain>-CloudEngineer/Developer/Stakeholder = <Group_to_give_admin_privileges>|
|`application_service`|`string`|N/A|Yes|The shortened name of the application service, e.g. sal|
|`description`|`string`|N/A|Yes|The shortened project name within the application service, e.g. auto-pass|
|`environment`|`string`|N/A|Yes|The name of your environment, e.g. n/p/dev/sit/uat/prod etc|
|`read_only_groups`|`map(string)`|{}|No|The map of groups with readonly privileges to add to SSO, key/value pair eg <domain>-CloudEngineer/Developer/Stakeholder = <Group_to_give_read_only_privileges>|
|`view_only_groups`|`map(string)`|{}|No|The map of groups with viewonly privileges to add to SSO, key/value pair eg <domain>-CloudEngineer/Developer/Stakeholder = <Group_to_give_view_only_privileges>|


## Example Usage
```terraform
module "sso-module" {
  source = "git@github.com:and-digital-cloud/terraform-aws-sso.git?ref=X.Y.Z"

  account_id          = "012345678"
  application_service = "service"
  description         = "description"
  environment         = "dev"
  admin_groups        = {
  # key = value, the key should be a way to reference the group type, this makes the Terraform output easier to read, the value is the group name that has been created in AD.
    CloudEngineer = "AWS-CloudEngineer",
  }
  read_only_groups    = {
    Developer = "AWS-Developer",
  }
  view_only_groups    = {
    Stakeholder = "AWS-Stakeholder",
  }
}
```

