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
    condition     = var.portexternal > 0
    error_message = "External Port must be greater than 0"
  }
}