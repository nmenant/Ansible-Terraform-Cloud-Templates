# F5 Deployment with Terraform and Ansible in VMWARE

Here you will have access to different deployment leveraging Ansible and Terraform.

the *terraform_module* directory contains modules that are re-used between the different deployment: deploy F5 BIG-IP standalone, deploy ubuntu, ...

Make sure that the following variables environment have been setup (<https://www.terraform.io/docs/providers/vsphere/index.html>):

* VSPHERE_SERVER: IP of your vCenter system
* VSPHERE_USER: User allowed to do API operations
* VSPHERE_PASSWORD: User Password

**This is WORK IN PROGRESS AND IS NOT YET FINALIZED**