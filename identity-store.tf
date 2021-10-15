data "aws_ssoadmin_instances" "this" {}

data "aws_identitystore_group" "admin" {
  for_each          = var.admin_groups
  identity_store_id = local.identity_store_id
  filter {
    attribute_path  = "DisplayName"
    attribute_value = each.value
  }
}

data "aws_identitystore_group" "read_only" {
  for_each          = var.read_only_groups
  identity_store_id = local.identity_store_id
  filter {
    attribute_path  = "DisplayName"
    attribute_value = each.value
  }
}

data "aws_identitystore_group" "view_only" {
  for_each          = var.view_only_groups
  identity_store_id = local.identity_store_id
  filter {
    attribute_path  = "DisplayName"
    attribute_value = each.value
  }
}

