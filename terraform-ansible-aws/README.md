Terraform and Ansible deployment templates
==========================================

This repo contains some generic templates to deploy systems using Terraform and Ansible.

Terraform is used to deploy the systems while Ansible will take care of the configuration of those systems.

Remarks
-------

* make sure that your AWS credentials are set on your system using Terraform / Ansible (.aws/credentials for example on mac)
* update terraform/variables.tf to deploy the infrastructure components acordingly
* do *terraform get* / *terraform plan* / *terraform apply* to deploy your infrastructure
* *terraform output* will give you the relevant public IPs related to your infrastructure. Put those IPs in your ansible/playbooks/inventory/hosts file
* create a file in ansible/playbooks/group_vars called *F5_systems*. Inside this file, put the admin password you want to setup on your BIG-IP this way :

```
ADMIN_PASSWORD: "XXXXX"
```

* update your ansible roles accordingly and then you can run *ansible-playbook -i inventory/hosts site.yml*