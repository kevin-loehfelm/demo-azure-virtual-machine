source "azure-arm" "ws2022" {
  # Auth
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id

  # General
  managed_image_resource_group_name = var.resource_group_name
  managed_image_name                = "${var.managed_image_name}-${formatdate("YYYY-MM-DD-HH-mm", timestamp())}"
  location                          = var.location
  vm_size                           = var.vm_size

  # Image settings
  os_type         = var.image["os_type"]
  image_publisher = var.image["image_publisher"]
  image_offer     = var.image["image_offer"]
  image_sku       = var.image["image_sku"]
  azure_tags      = var.azure_tags

  # Communicator
  communicator   = "winrm"
  winrm_use_ssl  = true
  winrm_insecure = true
  winrm_timeout  = "10m"
  winrm_username = "packer"
  winrm_password = "Packer!!!567"
}
