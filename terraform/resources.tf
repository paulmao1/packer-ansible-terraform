##################################################################################
# PROVIDERS
##################################################################################

provider "azurerm" {
  version = "=1.34.0"
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
}

##################################################################################
# DATA
##################################################################################
data "azurerm_image" "custom" {
  name                = "${var.custom_image_name}"
  resource_group_name = "${var.custom_image_resource_group_name}"
}

##################################################################################
# RESOURCES
##################################################################################

# RESOURCE GROUP #
resource "azurerm_resource_group" "ResourceGroup" {
  name     = "${var.prefix}-Resources"
  location =  "East US"
}

# NETWORKING #
resource "azurerm_virtual_network" "network" {
  name                = "${var.prefix}-Network"
  location            = "${azurerm_resource_group.ResourceGroup.location}"      
  resource_group_name = "${azurerm_resource_group.ResourceGroup.name}"
  address_space       = ["${var.network_address_space}"]
}

resource "azurerm_subnet" "subnet" {
  name = "${terraform.workspace}-Subnet"
  resource_group_name  = "${azurerm_resource_group.ResourceGroup.name}"
  virtual_network_name = "${azurerm_virtual_network.network.name}"
  address_prefix       = "${cidrsubnet(var.network_address_space, 8,  1)}"
}


#Network Interface#
resource "azurerm_network_interface" "nic" {
  count               = var.instance_count
  name                = "NIC-${count.index}"
  location            = "${azurerm_resource_group.ResourceGroup.location}"   
  network_security_group_id =  "${azurerm_network_security_group.nginx-sg.id}"
  resource_group_name = "${azurerm_resource_group.ResourceGroup.name}"
   ip_configuration {
     name = "testconfigure--${count.index}"
     subnet_id = "${element(azurerm_subnet.subnet.*.id,count.index%var.subnet_count)}"
     private_ip_address_allocation = "Dynamic"
     public_ip_address_id = "${element(azurerm_public_ip.mypublic.*.id,count.index)}"
   }
}

#Assign Public IP#
resource "azurerm_public_ip" "mypublic" {
  count               = var.instance_count
  name                = "PublicIP_${count.index}"
  location            = "${azurerm_resource_group.ResourceGroup.location}"  
  resource_group_name = "${azurerm_resource_group.ResourceGroup.name}"
  allocation_method   = "Static"
  }


#INSTANCE#
resource "azurerm_virtual_machine" "Azure-VM" {
  count                 = "${var.instance_count}"
  name                  = "VM-${count.index}"
  location              = "${azurerm_resource_group.ResourceGroup.location}"
  resource_group_name   = "${azurerm_resource_group.ResourceGroup.name}"
  network_interface_ids = ["${element(azurerm_network_interface.nic.*.id,count.index)}"]
  vm_size               = "Standard_B1s"

  storage_image_reference {
  id = "${data.azurerm_image.custom.id}"
  }

  storage_os_disk {
    name              = "myosdisk-${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "Linux-${count.index}"
    admin_username = "${var.username}"
    admin_password = "${var.password}"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}