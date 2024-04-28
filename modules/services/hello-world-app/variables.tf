variable "db_remote_state_bucket" {
  type = string
}

variable "db_remote_state_key" {
  type = string
}

variable "environment" {
  type = string
}

variable "ami" {
  type    = string
  default = "ami-06c4be2792f419b7b"
}

variable "instance_type" {
  type = string
}

variable "server_port" {
  type    = number
  default = 8080
}

variable "server_text" {
  type    = string
  default = "Hello, World!"
}

variable "custom_tags" {
  type = map(string)
}

variable "min_size" {
  type = number
}

variable "max_size" {
  type = number
}

variable "enable_autoscaling" {
  type    = bool
  default = true
}
