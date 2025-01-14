variable "label" {
  type        = string
  description = "resource label"
  default     = "demo"
}

variable "location" {
  type        = string
  description = "azure location"
  default     = "eastus"
}

variable "hcp_project" {
  type        = string
  description = "hcp project id"
  default     = "e22399dc-b1ac-477f-b8f7-c5b4c9dfa538"
}