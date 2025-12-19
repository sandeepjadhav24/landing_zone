rgm = {
  rg1 = {
    rgname   = "Monitoring"
    location = "francecentral"
  }
  rg2 = {
          rgname = "Monitoring1"
          location = "francecentral"
      }

}

stgm = {
  stg1 = {
    stg_name                 = "stgmonitor0998877"
    resource_group_name      = "Monitoring"
    location                 = "francecentral"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}

vnetm = {
  vnet1 = {
    vnet_name           = "vnet_monitor"
    resource_group_name = "Monitoring"
    location            = "francecentral"
    address_space       = ["10.0.0.0/16"]
  }
}

subnetm = {
  subnet1 = {
    subnet_name          = "frontend_VM1_subnet"
    resource_group_name  = "Monitoring"
    virtual_network_name = "vnet_monitor"
    address_prefixes     = ["10.0.0.0/24"]
  }
  subnet2 = {
    subnet_name          = "backend_VM2_subnet"
    resource_group_name  = "Monitoring"
    virtual_network_name = "vnet_monitor"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet3 = {
    subnet_name          = "central_VM3_subnet"
    resource_group_name  = "Monitoring"
    virtual_network_name = "vnet_monitor"
    address_prefixes     = ["10.0.2.0/24"]
  }
}

pipm = {
  pip1 = {
    pip_name            = "frontend_VM1_pip"
    resource_group_name = "Monitoring"
    location            = "francecentral"
    allocation_method   = "Static"
  }
  pip2 = {
    pip_name            = "backend_VM2_pip"
    resource_group_name = "Monitoring"
    location            = "francecentral"
    allocation_method   = "Static"
  }
  pip3 = {
    pip_name            = "central_VM3_pip"
    resource_group_name = "Monitoring"
    location            = "francecentral"
    allocation_method   = "Static"
  }
}

nicm = {
  nic1 = {
    nic_name             = "frontend_VM1_nic"
    resource_group_name  = "Monitoring"
    location             = "francecentral"
    virtual_network_name = "vnet_monitor"
    pip_name             = "frontend_VM1_pip"
    subnet_name          = "frontend_VM1_subnet"
    ip_configuration = {
      name                          = "Internal"
      private_ip_address_allocation = "Dynamic"
    }
  }
  nic2 = {
    nic_name             = "backend_VM2_nic"
    resource_group_name  = "Monitoring"
    location             = "francecentral"
    virtual_network_name = "vnet_monitor"
    pip_name             = "backend_VM2_pip"
    subnet_name          = "backend_VM2_subnet"
    ip_configuration = {
      name                          = "Internal"
      private_ip_address_allocation = "Dynamic"
    }
  }
  nic3 = {
    nic_name             = "central_VM3_nic"
    resource_group_name  = "Monitoring"
    location             = "francecentral"
    virtual_network_name = "vnet_monitor"
    pip_name             = "central_VM3_pip"
    subnet_name          = "central_VM3_subnet"
    ip_configuration = {
      name                          = "Internal"
      private_ip_address_allocation = "Dynamic"
    }
  }
}

vmm = {
  vm1 = {
    vm_name             = "frontend_VM1"
    nic_name            = "frontend_VM1_nic"
    resource_group_name = "Monitoring"
    location            = "francecentral"
    vm_size             = "Standard_B1s"
    admin_username      = "frontend"
    admin_password      = "frontend1@"
    computer_name       = "frontend"
    storage_os_disk = {
      name = "disk1"
    }

  }
  vm2 = {
    vm_name             = "backend_VM2"
    nic_name            = "backend_VM2_nic"
    resource_group_name = "Monitoring"
    location            = "francecentral"
    vm_size             = "Standard_B1s"
    admin_username      = "backend"
    admin_password      = "backend1@"
    computer_name       = "backend"
    storage_os_disk = {
      name = "disk2"
    }
  }
  vm3 = {
    vm_name             = "central_VM3"
    nic_name            = "central_VM3_nic"
    resource_group_name = "Monitoring"
    location            = "francecentral"
    vm_size             = "Standard_B1s"
    admin_username      = "central"
    admin_password      = "central1@"
    computer_name       = "central"
    storage_os_disk = {
      name = "disk3"
    }
  }
}
