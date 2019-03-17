Terraform and Ansible deployment templates
==========================================

This repo contains some generic templates to deploy systems using Terraform and Ansible.

Terraform is used to deploy the systems while Ansible will take care of the configuration of those systems.

Remarks
-------

* make sure that your AWS credentials are set on your system using Terraform / Ansible (.aws/credentials for example on mac)
* do *terraform plan* / *terraform apply* to deploy your infrastructure
* to get your new system IP address, do a *terraform output systems_public_ips*. This will give you the IP to add to your inventory
* put those IPs in your ansible/inventory/inventory file
* update your ansible roles accordingly and then you can run *ansible-playbook -i inventory site.yml*