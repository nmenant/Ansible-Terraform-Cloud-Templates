---

ADMIN_PASSWORD: "{{ VAULT_ADMIN_PASSWORD }}"
ADMIN_HTTPS_PORT: "8443"
ADMIN_USER: "admin"
LIST_AS3_POOL_SERVERS: "['${aws_f5_pool_members}']"
BIGIP1_HOSTNAME: "${aws_f5_bigip1_hostname}"
BIGIP2_HOSTNAME: "${aws_f5_bigip2_hostname}"