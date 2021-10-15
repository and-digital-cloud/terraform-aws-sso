resource "aws_ssoadmin_account_assignment" "admin" {
  for_each           = var.admin_groups
  instance_arn       = aws_ssoadmin_permission_set.admin.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.admin.arn
  principal_id       = data.aws_identitystore_group.admin[each.key].id
  principal_type     = "GROUP"
  target_type        = "AWS_ACCOUNT"
  target_id          = var.account_id
}

resource "aws_ssoadmin_account_assignment" "read_only" {
  for_each           = var.read_only_groups
  instance_arn       = aws_ssoadmin_permission_set.read_only.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.read_only.arn
  principal_id       = data.aws_identitystore_group.read_only[each.key].id
  principal_type     = "GROUP"
  target_type        = "AWS_ACCOUNT"
  target_id          = var.account_id
}

resource "aws_ssoadmin_account_assignment" "view_only" {
  for_each           = var.view_only_groups
  instance_arn       = aws_ssoadmin_permission_set.view_only.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.view_only.arn
  principal_id       = data.aws_identitystore_group.view_only[each.key].id
  principal_type     = "GROUP"
  target_type        = "AWS_ACCOUNT"
  target_id          = var.account_id
}

