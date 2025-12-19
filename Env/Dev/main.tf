module "Rgroup" {
    source = "../../Module/Rg"
    rgc = var.rgm
}

 module "stgaccount" {
    depends_on = [ module.Rgroup ]
    source = "../../Module/storage"
    stgc = var.stgm
 } 

 module "vnet" {
    depends_on = [ module.Rgroup ]
    source = "../../Module/Vnet"
    vnetc = var.vnetm
 }

 module "subnet" {
    depends_on = [ module.vnet ]
    source = "../../Module/Subnet"
    subnetc = var.subnetm
 }

 module "pip" {
    depends_on = [ module.subnet ]
    source = "../../Module/Pip"
    pipc = var.pipm
 }

 module "nic" {
    depends_on = [ module.pip ]
    source = "../../Module/Nic"
    nicc = var.nicm
 }

 module "vm" {
    depends_on = [ module.nic ]
    source = "../../Module/Vm"
    vmc = var.vmm
 }