# Windows Server 2022 Base Image

Sample ```windows.auto.pkrvars.hcl``` file for this Packer build

```
#--------------------------------------------
# Azure auth
#--------------------------------------------
client_id       = <entra_client_id>
client_secret   = <entra_client_secret>
tenant_id       = <entra_tenant_id>
subscription_id = <azure_subscription_id>

#--------------------------------------------
# General
#--------------------------------------------
resource_group_name = "rg-packer"
managed_image_name  = "mswin-server-2022-base"
location            = "eastus"
vm_size             = "Standard_B2ms"

#--------------------------------------------
# Image settings
#--------------------------------------------
image = {
  "os_type"         = "Windows"
  "image_publisher" = "MicrosoftWindowsServer"
  "image_offer"     = "WindowsServer"
  "image_sku"       = "2022-Datacenter"
}

# Not in use atm
azure_tags = {
  "image:os"          = "Microsoft Windows Server 2022"
  "image:create_date" = "{{ isotime \"2006-01-02 15:04:05\" }} UTC"
}
```