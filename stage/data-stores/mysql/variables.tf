variable "db_username" {
  type    = string
  default = "dbuser"
}

variable "db_password" {
  type      = string
  sensitive = true
}
