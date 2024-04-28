variable "alb_name" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "http_port" {
  type    = number
  default = 80
}

variable "sg_outbount_port" {
  type    = number
  default = 0
}
