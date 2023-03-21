#!/bin/bash
yum update -y
yum install httpd -y
FOLDER="https://raw.githubusercontent.com/sabrc/my--projects/main/terraform/kittens_instance/static-web"
cd /var/www/html
wget $FOLDER/index.html
wget $FOLDER/cat0.jpg
wget $FOLDER/cat1.jpg
wget $FOLDER/cat2.jpg
wget $FOLDER/cat3.png
systemctl start httpd
systemctl enable httpd