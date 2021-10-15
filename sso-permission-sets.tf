resource "aws_ssoadmin_permission_set" "admin" {
  name             = "AdministratorAccess"
  description      = "Provides admin access to AWS services and resources."
  instance_arn     = tolist(data.aws_ssoadmin_instances.this.arns)[0]
  session_duration = "PT12H"

  tags = merge(
    {
      Name = "${local.name}-perm-set-admin"
    },
    local.tags
  )
}

resource "aws_ssoadmin_permission_set" "read_only" {
  name             = "ReadOnlyAccess"
  description      = "Provides read only access to AWS services and resources."
  instance_arn     = tolist(data.aws_ssoadmin_instances.this.arns)[0]
  session_duration = "PT12H"

  tags = merge(
    {
      Name = "${local.name}-perm-set-read-only"
    },
    local.tags
  )
}

resource "aws_ssoadmin_permission_set" "view_only" {
  name             = "ViewOnlyAccess"
  description      = "Provides view only access to AWS services and resources."
  instance_arn     = tolist(data.aws_ssoadmin_instances.this.arns)[0]
  session_duration = "PT12H"

  tags = merge(
    {
      Name = "${local.name}-perm-set-view-only"
    },
    local.tags
  )
}

resource "aws_ssoadmin_managed_policy_attachment" "admin" {
  managed_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  instance_arn       = aws_ssoadmin_permission_set.admin.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.admin.arn
}

resource "aws_ssoadmin_managed_policy_attachment" "read_only" {
  managed_policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  instance_arn       = aws_ssoadmin_permission_set.read_only.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.read_only.arn
}

resource "aws_ssoadmin_managed_policy_attachment" "view_only" {
  managed_policy_arn = "arn:aws:iam::aws:policy/job-function/ViewOnlyAccess"
  instance_arn       = aws_ssoadmin_permission_set.view_only.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.view_only.arn
}

resource "aws_ssoadmin_permission_set_inline_policy" "admin" {
  inline_policy      = data.aws_iam_policy_document.admin_deny.json
  instance_arn       = aws_ssoadmin_permission_set.admin.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.admin.arn
}

resource "aws_ssoadmin_permission_set_inline_policy" "read_only" {
  inline_policy      = data.aws_iam_policy_document.read_only_deny.json
  instance_arn       = aws_ssoadmin_permission_set.read_only.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.read_only.arn
}

resource "aws_ssoadmin_permission_set_inline_policy" "view_only" {
  inline_policy      = data.aws_iam_policy_document.read_only_deny.json
  instance_arn       = aws_ssoadmin_permission_set.view_only.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.view_only.arn
}

