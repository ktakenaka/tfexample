variable "cluster_name" {
  type = string
}

variable "ami" {
  type    = string
  default = "ami-06c4be2792f419b7b"
}

variable "min_size" {
  type = number
}

variable "max_size" {
  type = number
}

variable "instance_type" {
  type = string
}

variable "enable_autoscaling" {
  type    = bool
  default = true
}

variable "custom_tags" {
  type    = map(string)
  default = {}
}

variable "server_port" {
  type    = number
  default = 8080
}

variable "subnet_ids" {
  type = list(string)
}

variable "target_group_arns" {
  type    = list(string)
  default = []
}

variable "health_check_type" {
  type    = string
  default = "EC2"
}

variable "user_data" {
  type    = string
  default = null
}

variable "sg_inbound_protocol" {
  type    = string
  default = "tcp"
}

variable "sg_inbound_ips" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}
