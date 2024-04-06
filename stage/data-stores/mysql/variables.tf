variable "db_username" {
  type      = string
  sensitive = true
  default   = "dbuser"
}

variable "db_password" {
  type      = string
  sensitive = true
}
