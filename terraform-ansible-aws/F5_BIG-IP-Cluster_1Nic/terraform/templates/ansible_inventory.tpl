[aws_ubuntu_systems]
${aws_ubuntu_data}

[F5_systems]
${aws_f5_bigip1_mgmt_public_ip} vs_ip=${aws_f5_bigip1_app_private_ip} self_ip=${aws_f5_bigip1_self_ip} bigip_hostname=${aws_f5_bigip1_hostname} bigip_peer=${aws_f5_bigip2_app_private_ip} 
${aws_f5_bigip2_mgmt_public_ip} vs_ip=${aws_f5_bigip2_app_private_ip} self_ip=${aws_f5_bigip2_self_ip} bigip_hostname=${aws_f5_bigip2_hostname} bigip_peer=${aws_f5_bigip1_app_private_ip}

[aws_ubuntu_systems:vars]
ansible_python_interpreter=/usr/bin/python3
ansible_user=ubuntu

[F5_systems:vars]
ansible_user=admin
