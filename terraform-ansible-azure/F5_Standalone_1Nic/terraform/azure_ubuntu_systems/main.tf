
resource "azurerm_public_ip" "ubuntu_az1_publicips" {
    count                        = "${var.ubuntu_instance_count}"
    name                         = "${var.owner}-${var.ubuntu_instance_name}-az1-public-ip-${format("%02d", count.index+1)}"
    location                     = "${var.azure_region}"
    resource_group_name          = "${var.azure_rg_name}"
    allocation_method            = "Static"

    tags {
        environment = "${var.owner}"
    }
}

resource "azurerm_public_ip" "ubuntu_az2_publicips" {
    count                        = "${var.ubuntu_instance_count}"
    name                         = "${var.owner}-${var.ubuntu_instance_name}-az2-public-ip-${format("%02d", count.index+1)}"
    location                     = "${var.azure_region}"
    resource_group_name          = "${var.azure_rg_name}"
    allocation_method            = "Static"

    tags {
        environment = "${var.owner}"
    }
}

resource "azurerm_network_interface" "ubuntu_az1_privatenics" {
    count                         = "${var.ubuntu_instance_count}"
    name                          = "${var.owner}-${var.ubuntu_instance_name}-az1-private-nic-${format("%02d", count.index+1)}"
    location                      = "${var.azure_region}"
    resource_group_name           = "${var.azure_rg_name}"
    network_security_group_id     = "${azurerm_network_security_group.azure_ubuntu_sg.id}"

    ip_configuration {
        name                          = "${var.owner}-${var.ubuntu_instance_name}-az1-private-ip-${format("%02d", count.index+1)}"
        subnet_id                     = "${var.private_subnet1_id}"
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = "${element(azurerm_public_ip.ubuntu_az1_publicips.*.id, count.index)}"
    }

    tags {
        environment = "${var.owner}"
    }
}

resource "azurerm_network_interface" "ubuntu_az2_privatenics" {
    count                         = "${var.ubuntu_instance_count}"
    name                          = "${var.owner}-${var.ubuntu_instance_name}-az2-private-nic-${format("%02d", count.index+1)}"
    location                      = "${var.azure_region}"
    resource_group_name           = "${var.azure_rg_name}"
    network_security_group_id     = "${azurerm_network_security_group.azure_ubuntu_sg.id}"

    ip_configuration {
        name                          = "${var.owner}-${var.ubuntu_instance_name}-az2-private-ip-${format("%02d", count.index+1)}"
        subnet_id                     = "${var.private_subnet1_id}"
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = "${element(azurerm_public_ip.ubuntu_az2_publicips.*.id, count.index)}"
    }

    tags {
        environment = "${var.owner}"
    }
}