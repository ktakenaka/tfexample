variable "server_port" {
  type    = number
  default = 8080
}

variable "cluster_name" {
  type = string
}

variable "db_remote_state_bucket" {
  type = string
}

variable "db_remote_state_key" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "min_size" {
  type = number
}

variable "max_size" {
  type = number
}

variable "custom_tags" {
  type = map(string)
}

variable "enable_autoscaling" {
  type    = bool
  default = true
}

variable "ami" {
  type    = string
  default = "ami-06c4be2792f419b7b"
}

variable "server_text" {
  type    = string
  default = "Hello, World!"
}
