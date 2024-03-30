variable "user_names" {
  type    = list(string)
  default = ["neo", "trinity", "morpheus"]
}

variable "give_neo_cloudwatch_full_access" {
  type    = bool
  default = false
}
