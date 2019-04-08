resource "azurerm_network_security_group" "azure_ubuntu_sg" {
    name                = "${var.owner}-ubuntu-SG"
    location            = "${var.azure_region}"
    resource_group_name = "${var.azure_rg_name}"
    
    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefixes      = ["${var.AllowedIPs}","${var.public_subnet1_cidr}","${var.private_subnet1_cidr}"]  
        destination_address_prefix = "*"
    }

    security_rule {
        name                       = "HTTP"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefixes      = ["${var.AllowedIPs}","${var.public_subnet1_cidr}","${var.private_subnet1_cidr}"]
        destination_address_prefix = "*"
    }

    security_rule {
        name                       = "HTTPS"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefixes      = ["${var.AllowedIPs}","${var.public_subnet1_cidr}","${var.private_subnet1_cidr}"]  
        destination_address_prefix = "*"
    }
    security_rule {
        name                       = "ICMP"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefixes      = ["${var.AllowedIPs}","${var.public_subnet1_cidr}","${var.private_subnet1_cidr}"]  
        destination_address_prefix = "*"
    }
    tags {
        environment = "${var.owner}"
    }
}