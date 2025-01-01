variable "port_internal" {
  description = "value of the internal port"
  default     = 0
  type        = number
  validation {
    condition     = var.port_internal > 0
    error_message = "Internal Port must be greater than 0"
  }
}

variable "port_external" {
  description = "value of the external port"
  default     = 0
  type        = number
  validation {
    condition     = var.port_external > 0
    error_message = "External Port must be greater than 0"
  }
}

variable "docker_user" {
  description = "Docker user"
  default     = "user"
  type        = string
  validation {
    condition     = var.docker_user != ""
    error_message = "Docker user must not be empty"
  }
}