variable "account_id" {
  description = "The account ID to create the groups and users in"
  type        = string
}

variable "admin_groups" {
  description = "The map of groups with admin privileges to add to SSO"
  type        = map(string)
  default     = {}
}

variable "application_service" {
  description = "The name of the application service, e.g. sale service"
  type        = string
}

variable "description" {
  description = "The project within the application service, e.g. auto passing"
  type        = string
}

variable "environment" {
  description = "The name of your environment, e.g. n/p/dev/sit/uat/prod etc"
  type        = string
}

variable "read_only_groups" {
  description = "The map of groups with read only privileges to add to SSO"
  type        = map(string)
  default     = {}
}

variable "view_only_groups" {
  description = "The map of groups with view only privileges to add to SSO"
  type        = map(string)
  default     = {}
}

