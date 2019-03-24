Terraform and Ansible deployment templates
==========================================

This repo contains some generic templates to deploy systems using Terraform and Ansible.

Terraform is used to deploy the systems while Ansible will take care of the configuration of those systems.

Remarks
-------

* make sure that your AWS credentials are set on your system using Terraform / Ansible (.aws/credentials for example on mac)
* update terraform/main.tf to deploy the infrastructure component you are interested in
* do *terraform get* / *terraform plan* / *terraform apply* to deploy your infrastructure
* For Example, to get your new system IP address, do a *terraform output ubuntu_ips*. This will give you the IP to add to your inventory
* put those IPs in your ansible/playbooks/xxxx/inventory file
* update your ansible roles accordingly and then you can run *ansible-playbook -i xxxx site.yml*