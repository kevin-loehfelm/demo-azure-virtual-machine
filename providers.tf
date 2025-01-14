provider "azurerm" {
  features {
    virtual_machine {
      delete_os_disk_on_deletion = true
    }
  }
}

provider "hcp" {
  project_id = var.hcp_project
}