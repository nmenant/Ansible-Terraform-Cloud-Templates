Terraform and Ansible deployment templates
==========================================

This repo contains some generic templates to deploy systems using Terraform and Ansible.

Terraform is used to deploy the systems while Ansible will take care of the configuration of those systems.

Remarks
-------

* make sure that your AWS credentials are set on your system using Terraform / Ansible (.aws/credentials for example on mac)
* to get your new system IP address, do a *terraform output systems_public_ips*. This will give you the IP to add to your inventory