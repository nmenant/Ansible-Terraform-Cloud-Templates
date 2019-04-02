Terraform and Ansible deployment templates
==========================================

This repo contains some generic templates to deploy systems using Terraform and Ansible.

Terraform is used to deploy the systems while Ansible will take care of the configuration of those systems.

Remarks - Terraform
-------------------

* make sure that your AWS credentials are set on your system using Terraform / Ansible (.aws/credentials for example on mac)
* update terraform/variables.tf to deploy the infrastructure components acordingly
* do *terraform get* / *terraform plan* / *terraform apply* to deploy your infrastructure
* *terraform output* will give you the relevant public IPs related to your infrastructure. Put those IPs in your ansible/playbooks/inventory/hosts file

Remarks - Ansible
-----------------

* update ansible/inventory/hosts with your ubuntu/F5 public ips. Setup *vs_ip* in the hosts file with the PRIVATE IP of your BIG-IP. 
* update playbooks/group_vars/vars with your ubuntu PRIVATE IPs (variable LIST_AS3_POOL_SERVERS)
* you have a file called ansible/playbooks/group_vars/F5_systems/vault. You need to create this file yourself to store your admin password.  Inside this file, put the admin password you want to setup on your BIG-IP this way :

```
VAULT_ADMIN_PASSWORD: "XXXXX"
```

* Once it's done, encrypt the file with the command *ansible-vault encrypt ansible/playbooks/group_vars/F5_systems/vault*
* update your ansible roles accordingly 
* You can run *ansible-playbook -i inventory/hosts site.yml --ask-vault-pass*