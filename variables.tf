variable "api_id" {
  description = "ID of the REST API"
  type        = string
  validation {
    condition     = length(var.api_id) > 0
    error_message = "api_id must not be empty."
  }
}

variable "domain_name" {
  description = "Custom domain name"
  type        = string
  validation {
    condition     = length(var.domain_name) > 0
    error_message = "domain_name must not be empty."
  }
}

variable "stage_name" {
  description = "Name of the API stage"
  type        = string
  validation {
    condition     = length(var.stage_name) > 0
    error_message = "stage_name must not be empty."
  }
}

variable "base_path" {
  description = "Base path for the mapping (empty string for root)"
  type        = string
  default     = null
}
