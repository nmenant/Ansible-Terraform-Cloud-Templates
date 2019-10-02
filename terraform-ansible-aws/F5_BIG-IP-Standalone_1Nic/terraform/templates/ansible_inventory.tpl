[aws_ubuntu_systems]
${aws_ubuntu_data}

[F5_systems]
#Must be in the form of <public IP> vs_ip=<private ip of the F5>
${aws_F5_public_ip} vs_ip=${aws_F5_private_ip}

[aws_ubuntu_systems:vars]
ansible_python_interpreter=/usr/bin/python3
ansible_user=ubuntu

[F5_systems:vars]
ansible_user=admin
