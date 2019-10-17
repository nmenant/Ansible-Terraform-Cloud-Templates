[aws_ubuntu_systems]
${aws_ubuntu_data}

[F5_systems]
#Must be in the form of <public IP> vs_ip=<private ip of the F5>
${aws_f5_bigip1_mgmt_public_ip} vs_ip=${aws_f5_bigip1_app_private_ip} self_ip=${aws_f5_bigip1_app_self_ip} hostname=${aws_f5_bigip1_hostname}
${aws_f5_bigip2_mgmt_public_ip} vs_ip=${aws_f5_bigip2_app_private_ip} self_ip=${aws_f5_bigip2_app_self_ip} hostname=${aws_f5_bigip2_hostname}

[aws_ubuntu_systems:vars]
ansible_python_interpreter=/usr/bin/python3
ansible_user=ubuntu

[F5_systems:vars]
ansible_user=admin
