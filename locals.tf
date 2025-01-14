locals {
  vms = {
    /*
    <vm_name> = {
      location   = var.location
      subnet_id  = module.network.subnets[0|1].id
      request_id = <request_id>
      network_id = <network_id>
    }
*/
    prod-vm1 = {
      location   = var.location
      subnet_id  = module.network.subnets[0].id
      request_id = "request2"
      network_id = "admin2"
    }
    prod-vm2 = {
      location   = var.location
      subnet_id  = module.network.subnets[1].id
      request_id = "request2"
      network_id = "admin2"
    }
  }
}