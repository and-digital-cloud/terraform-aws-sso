locals {
  tags = {
    Service           = var.application_service
    Environment       = var.environment
    Deployment_method = "terraform"
  }

  name              = "${var.environment}-${var.application_service}-${var.description}"
  identity_store_id = one(data.aws_ssoadmin_instances.this.identity_store_ids)
}

