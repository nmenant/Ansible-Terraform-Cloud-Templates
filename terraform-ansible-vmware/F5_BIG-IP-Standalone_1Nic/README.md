Terraform and Ansible deployment templates
==========================================

**This is WORK IN PROGRESS AND IS NOT YET FINALIZED**

This repo contains some generic templates to deploy systems using Terraform and Ansible.

Terraform is used to deploy the systems while Ansible will take care of the configuration of those systems.

Remarks - Terraform
-------------------

Make sure that the following variables environment have been setup (<https://www.terraform.io/docs/providers/vsphere/index.html>):

* VSPHERE_SERVER: IP of your vCenter system
* VSPHERE_USER: User allowed to do API operations
* VSPHERE_PASSWORD: User Password

* update terraform/terraform.tfvars to deploy the infrastructure components acordingly . If you want more customization, you may check terraform/variables.tf 
* update terraform/templates/ansible_inventory.tpl file so that you specify the right ansible_python_interpreter for your local environment 
* do *terraform init* / *terraform get* / *terraform plan* / *terraform apply* to deploy your infrastructure
* *terraform output* will give you the relevant public IPs related to your infrastructure.

Remarks - Ansible
-----------------

* ansible/inventory/hosts will be created automatically by Terraform. *vs_ip* in the hosts file is the PRIVATE IP of your BIG-IP.
* playbooks/group_vars/F5_systems/vars will list the tags to look for to identify the AWS instances to define as pool members. This file is created automatically by Terraform
* The AS3 declaration setup *Service Discovery* to identify the NGINX instances deployed. To do so, AS3 need to have access to your AWS infrastructure: It needs a AWS ACCESS Key and SECRET Key. Ansible playbook is setup to look for 2 environment variables: AWS_SECRETKEY_RO and AWS_ACCESSKEY_RO. Make sure to setup those environment variables on the device triggering the ansible playbook
* Update ansible/playbooks/group_vars/all file with the location of your private key
* You MUST create a file called f5_vault in ansible/playbooks/group_vars/F5_systems. You need to create this file yourself to store the admin password that will be used on your BIG-IP. The corresponding variables name to setup is: VAULT_ADMIN_PASSWORD. Example of f5_vault file: 

```yaml

    ---

    VAULT_ADMIN_PASSWORD: "myF5Password!"


```

  + Once it's done, encrypt the file with the command *ansible-vault encrypt ansible/playbooks/group_vars/F5_systems/f5_vault*
  + Update your ansible roles accordingly if needed.
* You can run *ansible-playbook -i inventory/hosts site.yml --ask-vault-pass*