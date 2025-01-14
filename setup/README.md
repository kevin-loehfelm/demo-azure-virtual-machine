## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >1.6.0 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | 3.0.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 4.14.0 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | 0.62.0 |
| <a name="requirement_time"></a> [time](#requirement\_time) | 0.12.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 3.0.2 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.14.0 |
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.62.0 |
| <a name="provider_time"></a> [time](#provider\_time) | 0.12.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuread_application.this](https://registry.terraform.io/providers/hashicorp/azuread/3.0.2/docs/resources/application) | resource |
| [azuread_service_principal.this](https://registry.terraform.io/providers/hashicorp/azuread/3.0.2/docs/resources/service_principal) | resource |
| [azurerm_role_assignment.this](https://registry.terraform.io/providers/hashicorp/azurerm/4.14.0/docs/resources/role_assignment) | resource |
| [tfe_registry_module.virtual_machine](https://registry.terraform.io/providers/hashicorp/tfe/0.62.0/docs/resources/registry_module) | resource |
| [tfe_registry_module.virtual_network](https://registry.terraform.io/providers/hashicorp/tfe/0.62.0/docs/resources/registry_module) | resource |
| [tfe_variable.arm_client_id](https://registry.terraform.io/providers/hashicorp/tfe/0.62.0/docs/resources/variable) | resource |
| [tfe_variable.arm_client_secret](https://registry.terraform.io/providers/hashicorp/tfe/0.62.0/docs/resources/variable) | resource |
| [tfe_variable.arm_subscription_id](https://registry.terraform.io/providers/hashicorp/tfe/0.62.0/docs/resources/variable) | resource |
| [tfe_variable.arm_tenant_id](https://registry.terraform.io/providers/hashicorp/tfe/0.62.0/docs/resources/variable) | resource |
| [tfe_variable.label](https://registry.terraform.io/providers/hashicorp/tfe/0.62.0/docs/resources/variable) | resource |
| [tfe_variable.location](https://registry.terraform.io/providers/hashicorp/tfe/0.62.0/docs/resources/variable) | resource |
| [tfe_workspace.this](https://registry.terraform.io/providers/hashicorp/tfe/0.62.0/docs/resources/workspace) | resource |
| [time_rotating.this](https://registry.terraform.io/providers/hashicorp/time/0.12.1/docs/resources/rotating) | resource |
| [azuread_client_config.current](https://registry.terraform.io/providers/hashicorp/azuread/3.0.2/docs/data-sources/client_config) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/4.14.0/docs/data-sources/subscription) | data source |
| [tfe_oauth_client.this](https://registry.terraform.io/providers/hashicorp/tfe/0.62.0/docs/data-sources/oauth_client) | data source |
| [tfe_organization.this](https://registry.terraform.io/providers/hashicorp/tfe/0.62.0/docs/data-sources/organization) | data source |
| [tfe_project.this](https://registry.terraform.io/providers/hashicorp/tfe/0.62.0/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_github_module_azure_virtual_machine"></a> [github\_module\_azure\_virtual\_machine](#input\_github\_module\_azure\_virtual\_machine) | github repo for azure virtual machine (vm) module | `string` | `"kevin-loehfelm/terraform-azurerm-virtual-machine"` | no |
| <a name="input_github_module_azure_virtual_network"></a> [github\_module\_azure\_virtual\_network](#input\_github\_module\_azure\_virtual\_network) | github repo for azure virtual network (vnet) module | `string` | `"kevin-loehfelm/terraform-azurerm-vnet"` | no |
| <a name="input_label"></a> [label](#input\_label) | resource label | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | azure location | `string` | n/a | yes |
| <a name="input_terraform_organization_name"></a> [terraform\_organization\_name](#input\_terraform\_organization\_name) | terraform organization name | `string` | n/a | yes |
| <a name="input_terraform_project_name"></a> [terraform\_project\_name](#input\_terraform\_project\_name) | terraform project name | `string` | n/a | yes |
| <a name="input_terraform_workspace_name"></a> [terraform\_workspace\_name](#input\_terraform\_workspace\_name) | terraform workspace name | `string` | n/a | yes |

## Outputs

No outputs.
