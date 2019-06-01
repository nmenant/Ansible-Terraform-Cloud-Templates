#Name of the owner of this deployment (no space)
owner = "NicoM"

#Name of the project
project_name = "TestTerraform"

#Public key to use to access the instances
ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCbfw73VHrRi9M+PlzpEW1ROrQkVYbIicoMrNeFHhgLc5aR4FOMvkUh924OcAvnalTASw0KSNAM7CaoSFcE1F/zPTHUnwCY/4liS9qenBeHBqeH1K7aBlaOb0V36zdlnUqRUzq/tL5J4TZkSyBntcKjRKlksxJrsPHvJSs/l36ryqmtyhzi5tLgnEvAKq8NCowpJKn2tornN52cYrf6JJhHRrQp/Cd5b5NXvAkde0mtsqkq6kwFSJwXr1+A2BxmabApDXSq0e0f5pjp0sXBSLweIWqHtFHXY53LGUBwsqvMiL4ijdgRNLTb9OWMtL4Pxy8qjC7Hsxb4iVPFZ9PmDJT3"

#VMWare specs
vmware_datacenter               = "LabFR"
vmware_cluster                  = "Cluster-Nicolas"

#VMWare specs for F5 BIG-IP Deployment
f5_instance_name                = "F5-BIG-IP"
vmware_f5_datastore             = "NAS_RAID0_1T"
//vmware_f5_resource_pool         = ""
vmware_f5_network_name          = "DPG_10_101_0_Vlan10"

#Your BIG-IP template needs a CD-Rom setup as client device to pass user-data successfully
vmware_f5_bigip_template_name    = "Template-BIGIP-14.1.0-0.0.116-scsi"

#VMWare specs for ubuntu systems
ubuntu_instance_name            = "Ubuntu-NGINX"
vmware_ubuntu_datastore         = "NAS_RAID0_1T"
//vmware_ubuntu_resource_pool     = ""
vmware_ubuntu_network_name      = "DPG_10_101_0_Vlan10"
vmware_ubuntu_template_name     = "ubuntu-xenial-16.04-cloudimg"
#Value assigned to the tag key Application - will be used for AS3 Service Discovery
app_tag_value = "www-NGINX"


