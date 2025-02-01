variable "port_internal" {
  description = "value of the internal port"
  default     = 0
  type        = number
  validation {
    condition     = var.port_internal > 0
    error_message = "Internal Port must be greater than 0"
  }
}

module "nginx" {
  source        = "./nginx-native"
  port_internal = 80
  port_external = var.port_internal
  docker_user   = "afatir"
}
