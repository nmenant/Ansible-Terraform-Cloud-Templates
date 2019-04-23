# Create a Public IP for bigip1
resource "azurerm_public_ip" "bigip1_public_ip" {
  name                      = "${var.owner}-bigip1-public-ip"
  location                  = "${var.azure_region}"
  resource_group_name       = "${var.azure_rg_name}"
  allocation_method         = "Dynamic"

  tags {
    Name           = "${var.owner}-bigip1-public-ip"
    owner          = "${var.owner}"
  }
}


# Create the 1nic interface for BIG-IP 01
resource "azurerm_network_interface" "bigip1_nic" {
  name                      = "${var.owner}-bigip1-mgmt-nic"
  location                  = "${var.azure_region}"
  resource_group_name       = "${var.azure_rg_name}"
  network_security_group_id = "${azurerm_network_security_group.bigip_sg.id}"

  ip_configuration {
    name                          = "primary"
    subnet_id                     = "${var.subnet1_public_id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${azurerm_public_ip.bigip1_public_ip.id}"
  }

  tags {
    Name           = "${var.owner}-bigip1-mgmt-nic"
    owner          = "${var.owner}"
  }
}

# Create F5 BIGIP1
resource "azurerm_virtual_machine" "f5bigip1" {
  name                         = "${var.owner}-f5-bigip1"
  location                     = "${var.azure_region}"
  resource_group_name          = "${var.azure_rg_name}"
  primary_network_interface_id = "${azurerm_network_interface.bigip1_nic.id}"
  network_interface_ids        = ["${azurerm_network_interface.bigip1_nic.id}"]
  vm_size                      = "${var.f5_instance_type}"
  
  # Uncomment this line to delete the OS disk automatically when deleting the VM
   delete_os_disk_on_termination = true


  # Uncomment this line to delete the data disks automatically when deleting the VM
   delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "f5-networks"
    offer     = "${var.f5_product_name}"
    sku       = "${var.f5_image_name}"
    version   = "${var.f5_version}"
  }

  storage_os_disk {
    name              = "${var.owner}-bigip1-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "${var.owner}-bigip1-os"
    admin_username = "${var.f5_username}"
  #  admin_password = "${var.upassword}"
  #  custom_data    = "${data.template_file.vm_onboard.rendered}"
  }

  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
        path     = "/home/azureuser/.ssh/authorized_keys"
        key_data = "${var.f5_ssh_publickey}"
    }
  }
  
#  os_profile_linux_config {
#    disable_password_authentication = false
#  }

  plan {
    name          = "${var.f5_image_name}"
    publisher     = "f5-networks"
    product       = "${var.f5_product_name}"
  }

  tags {
    Name           = "${var.owner}-f5bigip1"
    owner          = "${var.owner}"
  }
}

# Setup BIG-IP with AS3 and DO
data "template_file" "vm_onboard" {
  template = "${file("${path.module}/onboard.tpl")}"

  vars {
    uname        	  = "${var.uname}"
    upassword       = "${var.upassword}"
    DO_onboard_URL  = "${var.DO_onboard_URL}"
    AS3_URL		      = "${var.AS3_URL}"
    libs_dir		    = "${var.libs_dir}"
    onboard_log		  = "${var.onboard_log}"
  }
}