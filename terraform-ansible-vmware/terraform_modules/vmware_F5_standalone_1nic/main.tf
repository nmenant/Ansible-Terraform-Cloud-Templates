data "vsphere_datacenter" "vmware_dc" {
  name = var.vmware_datacenter
}
data "vsphere_compute_cluster" "vmware_cluster" {
  name          = var.vmware_cluster
  datacenter_id = data.vsphere_datacenter.vmware_dc.id
}
data "vsphere_network" "f5_network" {
  name          = var.vmware_f5_network_name
  datacenter_id = data.vsphere_datacenter.vmware_dc.id
}

data "vsphere_virtual_machine" "f5_template" {
  name          = var.vmware_f5_bigip_template_name
  datacenter_id = data.vsphere_datacenter.vmware_dc.id
}

data "vsphere_datastore" "f5_datastore" {
  name          = var.vmware_f5_datastore
  datacenter_id = data.vsphere_datacenter.vmware_dc.id
}

data "template_file" "f5_bigip_onboard" {
  template = file("../../F5_BIG-IP-Standalone_1Nic/templates/f5_onboard.tpl")

  vars = {
    DO_URL          = var.DO_URL
    AS3_URL		      = var.AS3_URL
    libs_dir		    = var.libs_dir
    onboard_log		  = var.onboard_log
  }
}

resource "vsphere_virtual_machine" "f5_vm" {
  # Define VM name using the resource count +1 making the first name server-01
  # except when an offset is used. If for example offset=1 the first name is server-02
  name                  = "${var.f5_instance_name}-1"
  resource_pool_id      = data.vsphere_compute_cluster.vmware_cluster.resource_pool_id
  
  # Changed from example; datastore cluster instead of datastore
  datastore_id          = data.vsphere_datastore.f5_datastore.id
 
  num_cpus              = var.f5_nb_cpu
  memory                = var.f5_memory
  guest_id              = data.vsphere_virtual_machine.f5_template.guest_id
  scsi_type             = data.vsphere_virtual_machine.f5_template.scsi_type
 
  network_interface {
    network_id          = data.vsphere_network.f5_network.id
    adapter_type        = data.vsphere_virtual_machine.f5_template.network_interface_types[0]
  }
 
  disk {
    label               = "disk0"
    size                = data.vsphere_virtual_machine.f5_template.disks.0.size
    eagerly_scrub       = data.vsphere_virtual_machine.f5_template.disks.0.eagerly_scrub
    thin_provisioned    = data.vsphere_virtual_machine.f5_template.disks.0.thin_provisioned
  }
  
  cdrom {
    datastore_id        = data.vsphere_datastore.f5_datastore.id
    path                = "configdrive.iso"
  }

 # vapp {
 #   properties = {
 #     hostname    = "${var.f5_instance_name}-1"
 #     public-keys = var.ssh_public_key
 #     user-data   = "${base64encode(data.template_file.f5_bigip_onboard.rendered)}"
 #   }
 # }

  clone {
    template_uuid       = data.vsphere_virtual_machine.f5_template.id
  }
}