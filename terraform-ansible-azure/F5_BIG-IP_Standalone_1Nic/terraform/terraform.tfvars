#Name of the owner of this deployment (no space)
owner = "NicoM"

#Name of the project
project_name = "TestTerraform"

#AWS Region to use
azure_region = "francecentral"

#AWS AZ to use. Need 2
azure_az1 = "1"
azure_az2 = "2"

#Public key to use to access the instances - azure need it in this format
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCbfw73VHrRi9M+PlzpEW1ROrQkVYbIicoMrNeFHhgLc5aR4FOMvkUh924OcAvnalTASw0KSNAM7CaoSFcE1F/zPTHUnwCY/4liS9qenBeHBqeH1K7aBlaOb0V36zdlnUqRUzq/tL5J4TZkSyBntcKjRKlksxJrsPHvJSs/l36ryqmtyhzi5tLgnEvAKq8NCowpJKn2tornN52cYrf6JJhHRrQp/Cd5b5NXvAkde0mtsqkq6kwFSJwXr1+A2BxmabApDXSq0e0f5pjp0sXBSLweIWqHtFHXY53LGUBwsqvMiL4ijdgRNLTb9OWMtL4Pxy8qjC7Hsxb4iVPFZ9PmDJT3"

#Public IPs used to access your instances
AllowedIPs = ["80.12.58.29/32","109.7.65.101/32","92.154.17.15/32", "92.151.103.40/32"]

#F5 Image to deploy
f5_version = "latest"
f5_image_name = "f5-bigip-virtual-edition-200m-best-hourly"
f5_product_name = "f5-big-ip-best"

#Value assigned to the tag key Application - will be used for AS3 Service Discovery
app_tag_value = "www-NGINX"