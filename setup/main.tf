# Data Source(s): Terraform Organization
data "tfe_organization" "this" {
  name = var.terraform_organization_name
}

# Data Source(s): Terraform Project
data "tfe_project" "this" {
  name         = var.terraform_project_name
  organization = data.tfe_organization.this.name
}

# Resource(s): Terraform Workspace
resource "tfe_workspace" "this" {
  name           = var.terraform_workspace_name
  project_id     = data.tfe_project.this.id
  organization   = data.tfe_organization.this.name
  queue_all_runs = false
  tag_names = [
    var.label
  ]
}

# Data Source(s): Entra ID Client Configuration
data "azuread_client_config" "current" {}

# Resource(s): Time Rotating
resource "time_rotating" "this" {
  rotation_days = 180
}

# Resource(s): Entra Application (Client ID + Secret)
resource "azuread_application" "this" {
  display_name = var.label
  owners       = [data.azuread_client_config.current.object_id]

  password {
    display_name = "terraform-1"
    start_date   = time_rotating.this.id
    end_date     = timeadd(time_rotating.this.id, "4320h")
  }
}

# Resource(s): Entra Service Principal
resource "azuread_service_principal" "this" {
  client_id                    = azuread_application.this.client_id
  app_role_assignment_required = false
  owners = [
    data.azuread_client_config.current.object_id
  ]
}

# Data Source(s): Azure Subscription
data "azurerm_subscription" "current" {}

# Resource(s): Azure Role Assignment
resource "azurerm_role_assignment" "this" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.this.object_id
}

# Data Source(s): Terraform GitHub Application
data "tfe_oauth_client" "this" {
  organization     = var.terraform_organization_name
  service_provider = "github"
}

# Resource(s): Terraform Module - Virtual Machine
resource "tfe_registry_module" "virtual_machine" {
  organization    = data.tfe_organization.this.name
  initial_version = "1.0.0"
  vcs_repo {
    display_identifier = var.github_module_azure_virtual_machine
    identifier         = var.github_module_azure_virtual_machine
    oauth_token_id     = data.tfe_oauth_client.this.oauth_token_id
    branch             = "main"
    tags               = false
  }
}

# Resource(s): Terraform Module - Virtual Network
resource "tfe_registry_module" "virtual_network" {
  organization    = data.tfe_organization.this.name
  initial_version = "1.0.0"

  vcs_repo {
    display_identifier = var.github_module_azure_virtual_network
    identifier         = var.github_module_azure_virtual_network
    oauth_token_id     = data.tfe_oauth_client.this.oauth_token_id
    branch             = "main"
    tags               = false
  }

  test_config {
    tests_enabled = true
  }
}

# Resource(s): Terraform Variable - label
resource "tfe_variable" "label" {
  key          = "label"
  value        = var.label
  category     = "terraform"
  workspace_id = tfe_workspace.this.id
  description  = "resource label"
}

# Resource(s): Terraform Variable - location
resource "tfe_variable" "location" {
  key          = "location"
  value        = var.location
  category     = "terraform"
  workspace_id = tfe_workspace.this.id
  description  = "azure location"
}

# Resource(s): Terraform Environemnt Variable - ARM_TENANT_ID
resource "tfe_variable" "arm_tenant_id" {
  key          = "ARM_TENANT_ID"
  value        = data.azuread_client_config.current.tenant_id
  category     = "env"
  workspace_id = tfe_workspace.this.id
  description  = "entra tenant id"
}

# Resource(s): Terraform Environemnt Variable - ARM_CLIENT_ID
resource "tfe_variable" "arm_client_id" {
  key          = "ARM_CLIENT_ID"
  value        = azuread_application.this.client_id
  category     = "env"
  workspace_id = tfe_workspace.this.id
  description  = "entra application id"
}

# Resource(s): Terraform Environemnt Variable - ARM_CLIENT_SECRET
resource "tfe_variable" "arm_client_secret" {
  key          = "ARM_CLIENT_SECRET"
  value        = tolist(azuread_application.this.password)[0].value
  category     = "env"
  sensitive    = true
  workspace_id = tfe_workspace.this.id
  description  = "entra application secret"
}

# Resource(s): Terraform Environemnt Variable - ARM_SUBSCRIPTION_ID
resource "tfe_variable" "arm_subscription_id" {
  key          = "ARM_SUBSCRIPTION_ID"
  value        = data.azurerm_subscription.current.subscription_id
  category     = "env"
  workspace_id = tfe_workspace.this.id
  description  = "azure subscription id"
}