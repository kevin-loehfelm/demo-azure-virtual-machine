# module: azure virtual network (vnet)
module "network" {
  # source = "./modules/terraform-azurerm-vnet"
  source  = "app.terraform.io/kloehfelm-demo/vnet/azurerm"
  version = "1.0.0"

  label    = var.label
  location = var.location
}

# resource: azure resource group for compute resources
resource "azurerm_resource_group" "compute" {
  name     = "${var.label}-compute"
  location = var.location
}

# data source: hcp packer prod image for windows server 2022
data "hcp_packer_artifact" "win2022_prod" {
  bucket_name  = "mswin-server-2022-base"
  channel_name = "prod"
  platform     = "azure"
  region       = var.location
}

# data source: hcp packer dev image for windows server 2022
data "hcp_packer_artifact" "win2022_dev" {
  bucket_name  = "mswin-server-2022-base"
  channel_name = "dev"
  platform     = "azure"
  region       = var.location
}

# module: azure virtual machine - single vm
module "single" {
  # source = "./modules/terraform-azurerm-virtual-machine"
  source  = "app.terraform.io/kloehfelm-demo/virtual-machine/azurerm"
  version = "1.0.0"

  name                = "single-vm1"
  vm_image_id         = data.hcp_packer_artifact.win2022_dev.external_identifier
  resource_group_name = azurerm_resource_group.compute.name
  location            = var.location
  subnet_id           = module.network.subnets[0].id
  tags = {
    createdBy = "admin1"
    requestId = "request1"
  }
}

# moddule: azure virtual machine - group of vms
module "multi" {
  # source = "./modules/terraform-azurerm-virtual-machine"
  source              = "app.terraform.io/kloehfelm-demo/virtual-machine/azurerm"
  version             = "1.0.0"
  for_each            = local.vms
  name                = each.key
  vm_image_id         = data.hcp_packer_artifact.win2022_prod.external_identifier
  resource_group_name = azurerm_resource_group.compute.name
  location            = var.location
  subnet_id           = each.value.subnet_id
  tags = {
    createdBy = each.value.network_id
    requestId = each.value.request_id
  }
}