[vmware_ubuntu_systems]
${vmware_ubuntu_data}

[F5_systems]
#Must be in the form of <public IP> vs_ip=<private ip of the F5>
${vmware_F5_public_ip} vs_ip=${vmware_F5_private_ip}

[vmware_ubuntu_systems:vars]
ansible_python_interpreter=/usr/bin/python3
ansible_user=ubuntu

[F5_systems:vars]
ansible_python_interpreter=/Users/menant/projects/python-virtualenv/myAnsible/bin/python
ansible_user=root
