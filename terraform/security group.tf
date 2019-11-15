# SECURITY GROUPS #
resource "azurerm_network_security_group" "nginx-sg" {
  name                = "nginx-sg"
  location            = "${azurerm_resource_group.ResourceGroup.location}"  
  resource_group_name = "${azurerm_resource_group.ResourceGroup.name}"
  security_rule {
        name                       = "${var.protocols[0]}"
        priority                   = 1000
        direction                  = "Inbound"
        protocol                   = "Tcp"
        source_port_range          = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        destination_port_range     = "${var.ports[0]}"
        access                     = "Allow"
    }
    security_rule {
        name                       = "${var.protocols[1]}"
        priority                   = 1001
        direction                  = "Inbound"
        protocol                   = "Tcp"
        source_port_range          = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        destination_port_range     = "${var.ports[1]}"
        access                     = "Allow"
    }
}
resource "azurerm_subnet_network_security_group_association" "nginx-sg" {
  count          = var.subnet_count
  subnet_id      = "${element(azurerm_subnet.subnet.*.id,count.index)}"
  network_security_group_id = "${azurerm_network_security_group.nginx-sg.id}"
}