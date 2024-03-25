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
