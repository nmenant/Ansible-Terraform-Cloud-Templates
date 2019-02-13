AWS Cloud Formation examples
============================

This repo contains some generic Cloud Formation template for AWS. 

Templates
---------

Right now you have 3 different templates available to deploy web applications: 

* CFT-2WebServers: This template will deploy in a specified VPC/Subnet 2 Web servers running Apache, MySQL and PHP
* CFT-2WebServers-Security-Hackazon: this template will deploy 2 Hackazon web applications. More information about this 
    web application can be found here <https://appspider.help.rapid7.com/docs/hackazon-installation-guide>. We use this docker
    image: mutzel/all-in-one-hackazon. credentials are: admin/hackmesilly
* CFT-2WebServers-Security-DVWA: this template will deploy 2 DVWA web servers. DVWA stands for Dawn Vulnerable 
    Web Application. More information about this web application can be found here: <http://www.dvwa.co.uk/>. We use this docker
    image: vulnerables/web-dvwa. credentials are: admin/password

**The Hackazon and DVWA web application are vulnerable to attacks. It is on PURPOSE.
    You shouldn't expose it openly. You MUST make sure that you will specify a USERIP in the template to block access 
    to this application to other users if you plan to expose this to the web. DO IT AT YOUR OWN RISK**