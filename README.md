## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >1.6.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 4.14.0 |
| <a name="requirement_hcp"></a> [hcp](#requirement\_hcp) | 0.101.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.14.0 |
| <a name="provider_hcp"></a> [hcp](#provider\_hcp) | 0.101.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dev"></a> [dev](#module\_dev) | app.terraform.io/kloehfelm-demo/virtual-machine/azurerm | 1.0.0 |
| <a name="module_network"></a> [network](#module\_network) | app.terraform.io/kloehfelm-demo/vnet/azurerm | 1.0.0 |
| <a name="module_prod"></a> [prod](#module\_prod) | app.terraform.io/kloehfelm-demo/virtual-machine/azurerm | 1.0.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.compute](https://registry.terraform.io/providers/hashicorp/azurerm/4.14.0/docs/resources/resource_group) | resource |
| [hcp_packer_artifact.win2022_dev](https://registry.terraform.io/providers/hashicorp/hcp/0.101.0/docs/data-sources/packer_artifact) | data source |
| [hcp_packer_artifact.win2022_prod](https://registry.terraform.io/providers/hashicorp/hcp/0.101.0/docs/data-sources/packer_artifact) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_hcp_project"></a> [hcp\_project](#input\_hcp\_project) | hcp project id | `string` | `"e22399dc-b1ac-477f-b8f7-c5b4c9dfa538"` | no |
| <a name="input_label"></a> [label](#input\_label) | resource label | `string` | `"demo"` | no |
| <a name="input_location"></a> [location](#input\_location) | azure location | `string` | `"eastus"` | no |

## Outputs

No outputs.
