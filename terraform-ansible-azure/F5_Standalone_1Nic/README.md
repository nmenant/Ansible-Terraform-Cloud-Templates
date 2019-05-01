Terraform and Ansible deployment templates
==========================================

This repo contains some generic templates to deploy systems using Terraform and Ansible.

Terraform is used to deploy the systems while Ansible will take care of the configuration of those systems.

Remarks - Terraform
-------------------

* make sure that your Azure credentials are set on your system (env variables): https://docs.microsoft.com/en-us/azure/virtual-machines/linux/terraform-install-configure
* update terraform/variables.tf to deploy the infrastructure components acordingly
* do *terraform get* / *terraform plan* / *terraform apply* to deploy your infrastructure
* *terraform output* will give you the relevant public IPs related to your infrastructure.

Remarks - Ansible
-----------------

* ansible/inventory/hosts will be created automatically by Terraform. *vs_ip* in the hosts file is the PRIVATE IP of your BIG-IP.
* playbooks/group_vars/F5_systems/vars will list your ubuntu PRIVATE IPs (variable LIST_AS3_POOL_SERVERS). This is created automatically by Terraform
* you should have a file called ansible/playbooks/group_vars/F5_systems/F5_vault. You need to create this file yourself to store your BIG-IP admin password.  Inside this file, the variable should be named VAULT_ADMIN_PASSWORD.
* Once it's done, encrypt the file with the command *ansible-vault encrypt ansible/playbooks/group_vars/F5_systems/vault*
* update your ansible roles accordingly 
* You can run *ansible-playbook -i inventory/hosts site.yml --ask-vault-pass*
