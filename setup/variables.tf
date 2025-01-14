variable "terraform_organization_name" {
  type        = string
  description = "terraform organization name"
}

variable "terraform_project_name" {
  type        = string
  description = "terraform project name"
}

variable "terraform_workspace_name" {
  type        = string
  description = "terraform workspace name"
}

variable "label" {
  type        = string
  description = "resource label"
}

variable "location" {
  type        = string
  description = "azure location"
}

variable "github_module_azure_virtual_machine" {
  type        = string
  description = "github repo for azure virtual machine (vm) module"
  default     = "kevin-loehfelm/terraform-azurerm-virtual-machine"
}

variable "github_module_azure_virtual_network" {
  type        = string
  description = "github repo for azure virtual network (vnet) module"
  default     = "kevin-loehfelm/terraform-azurerm-vnet"
}