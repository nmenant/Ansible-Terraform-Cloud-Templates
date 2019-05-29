data "vsphere_datacenter" "vmware_dc" {
  name = var.vmware_datacenter
}
data "vsphere_network" "ubuntu_network" {
  name          = var.vmware_ubuntu_network_name
  datacenter_id = data.vsphere_datacenter.vmware_dc.id
}
data "vsphere_compute_cluster" "vmware_cluster" {
  name          = var.vmware_cluster
  datacenter_id = data.vsphere_datacenter.vmware_dc.id
}

data "vsphere_virtual_machine" "ubuntu_template" {
  name          = var.vmware_ubuntu_template_name
  datacenter_id = data.vsphere_datacenter.vmware_dc.id
}

data "vsphere_datastore" "ubuntu_datastore" {
  name          = var.vmware_ubuntu_datastore
  datacenter_id = data.vsphere_datacenter.vmware_dc.id
}

resource "vsphere_virtual_machine" "ubuntu_vms" {
  count                 = var.ubuntu_instance_count
  
  # Define VM name using the resource count +1 making the first name server-01
  # except when an offset is used. If for example offset=1 the first name is server-02
  name                  = "${var.ubuntu_instance_name}-${format("%02d", count.index + 1)}"
  resource_pool_id      = data.vsphere_compute_cluster.vmware_cluster.resource_pool_id
  
  # Changed from example; datastore cluster instead of datastore
  datastore_id          = data.vsphere_datastore.ubuntu_datastore.id
 
  num_cpus              = var.ubuntu_nb_cpu
  memory                = var.ubuntu_memory
  guest_id              = data.vsphere_virtual_machine.ubuntu_template.guest_id
  scsi_type             = data.vsphere_virtual_machine.ubuntu_template.scsi_type
 
  network_interface {
    network_id          = data.vsphere_network.ubuntu_network.id
    adapter_type        = data.vsphere_virtual_machine.ubuntu_template.network_interface_types[0]
  }
 
  disk {
    label               = "disk0"
    size                = data.vsphere_virtual_machine.ubuntu_template.disks.0.size
    eagerly_scrub       = data.vsphere_virtual_machine.ubuntu_template.disks.0.eagerly_scrub
    thin_provisioned    = data.vsphere_virtual_machine.ubuntu_template.disks.0.thin_provisioned
  }
 
  clone {
    template_uuid       = data.vsphere_virtual_machine.ubuntu_template.id
 
    customize {
      linux_options {
        # Define hostname using the resource count +1 making the first name server-01
        # except when an offset is used. If for example offset=1 the first name is server-02
        host_name       = "${var.ubuntu_instance_name}${format("%02d", count.index + 1 )}"
        domain          = var.domain_name
      }
    }
  }
}