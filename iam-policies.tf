data "aws_iam_policy_document" "admin_deny" {
  statement {
    effect = "Deny"
    actions = [
      "aws-portal:*Modify*",
      "aws-portal:*PaymentMethods*",
      "budgets:CreateBudgetAction",
      "budgets:DeleteBudgetAction",
      "budgets:ExecuteBudgetAction",
      "budgets:ModifyBudget",
      "budgets:UpdateBudgetAction",
      "cur:DeleteReportDefinition",
      "cur:ModifyReportDefinition",
      "cur:PutReportDefinition",
      "iam:*AccessKey*",
      "iam:*Certificate*",
      "iam:CreateAccountAlias",
      "iam:*Credential*",
      "iam:DeleteAccountAlias",
      "iam:*Group*",
      "iam:*LoginProfile*",
      "iam:*MFA*",
      "iam:*OpenID*",
      "iam:*Password*",
      "iam:*SAML*",
      "iam:SetSecurityTokenServicePreferences",
      "iam:*SSH*",
      "iam:*User*",
      "organizations:*",
      "sso:*"
    ]
    resources = ["*"]
  }

  statement {
    effect  = "Deny"
    actions = ["iam:DeleteServiceLinkedRole"]
    resources = [
      "arn:aws:iam::*:role/aws-service-role/trustedadvisor.amazonaws.com/AWSServiceRoleForTrustedAdvisor",
      "arn:aws:iam::*:role/aws-service-role/transitgateway.amazonaws.com/AWSServiceRoleForVPCTransitGateway",
      "arn:aws:iam::*:role/aws-service-role/support.amazonaws.com/AWSServiceRoleForSupport",
      "arn:aws:iam::*:role/aws-service-role/sso.amazonaws.com/AWSServiceRoleForSSO",
      "arn:aws:iam::*:role/aws-service-role/servicequotas.amazonaws.com/AWSServiceRoleForServiceQuotas",
      "arn:aws:iam::*:role/aws-service-role/organizations.amazonaws.com/AWSServiceRoleForOrganizations"
    ]
  }

  statement {
    effect = "Deny"
    actions = [
      "iam:AttachRolePolicy",
      "iam:CreateRole",
      "iam:DeleteRole",
      "iam:DeleteRolePermissionsBoundary",
      "iam:DeleteRolePolicy",
      "iam:DetachRolePolicy",
      "iam:PutRolePermissionsBoundary",
      "iam:PutRolePolicy",
      "iam:TagRole",
      "iam:UntagRole",
      "iam:UpdateAssumeRolePolicy",
      "iam:UpdateRole"
    ]
    resources = ["arn:aws:iam::*:role/aws-reserved/sso.amazonaws.com/*"]
  }

}

data "aws_iam_policy_document" "read_only_deny" {
  statement {
    effect = "Deny"
    actions = [
      "aws-portal:*PaymentMethods*",
      "iam:*Group*",
      "iam:*AccessKey*",
      "iam:*Certificate*",
      "iam:*Credential*",
      "iam:*LoginProfile*",
      "iam:*MFA*",
      "iam:*OpenID*",
      "iam:*Password*",
      "iam:*SAML*",
      "iam:*SSH*",
      "iam:*User*",
      "organizations:*",
      "sso:*"
    ]
    resources = ["*"]
  }
}

