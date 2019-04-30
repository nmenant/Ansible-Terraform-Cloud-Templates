Terraform and Ansible deployment templates
==========================================

This repo contains some generic templates to deploy systems using Terraform and Ansible.

Terraform is used to deploy the systems while Ansible will take care of the configuration of those systems.

Remarks - Terraform
-------------------

* make sure that your AWS credentials are set on your system using Terraform / Ansible (.aws/credentials for example on mac)
* update terraform/variables.tf to deploy the infrastructure components acordingly
* do *terraform get* / *terraform plan* / *terraform apply* to deploy your infrastructure
* *terraform output* will give you the relevant public IPs related to your infrastructure.

Remarks - Ansible
-----------------

* ansible/inventory/hosts will be created automatically by Terraform. *vs_ip* in the hosts file is the PRIVATE IP of your BIG-IP.
* playbooks/group_vars/F5_systems/vars will list the tags to look for to identify the AWS instances to define as pool members. This file is created automatically by Terraform
* you MUST create a file called f5_vault in ansible/playbooks/group_vars/F5_systems. You need to create this file yourself to store the admin password that will be used on your BIG-IP. the ACCESSKEY and SECRETKEY will be used by AS3 to automatically discover your Application instances.  Inside this file, put the admin password, ACCESSKEY and SECRETKEY. you want to setup on your BIG-IP this way :

```
VAULT_ADMIN_PASSWORD: "XXXXX"

VAULT_AWS_ACCESSKEY: "XXXXX"

VAULT_AWS_SECRETKEY: "XXXXXXXXX"
```

* Once it's done, encrypt the file with the command *ansible-vault encrypt ansible/playbooks/group_vars/F5_systems/f5_vault*
* update your ansible roles accordingly if needed.
* You can run *ansible-playbook -i inventory/hosts site.yml --ask-vault-pass*