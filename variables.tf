variable "subscription_id" {
  type=string
}
variable "client_id" {
  type=string
}
variable "client_secret" {
  type=string
}
variable "tenant_id" {
  type=string
}

variable "administrator_login" {
  description = "juliomcit"
  default     = "default_admin"
}

variable "adminstrator_login_password" {
  type = string
}

variable "version-number" {
  type = string
  default = "12.0"
}
