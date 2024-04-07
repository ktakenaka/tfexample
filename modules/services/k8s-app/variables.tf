variable "name" {
  type = string
}

variable "image" {
  type = string
}

variable "container_port" {
  type = number
}

variable "replicas" {
  type = number
}

variable "environment_variables" {
  type    = map(string)
  default = {}
}
