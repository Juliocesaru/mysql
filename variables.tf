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
    type = string
    default = "juliomcit"
}
variable "adminstrator_login_password" {
  type = string
  default = "Juliana3103$"
}

variable "version-number" {
  type = string
  default = "12.0"
}
