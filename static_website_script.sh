#!/bin/bash

sudo su
yum update -y
yum install -y httpd
cd /var/www/html
yum install git -y
git clone https://github.com/chagak/honey-static-webapp.git
cp -r honey-static-webapp/* /var/www/html/
rm -rf honey-static-webapp/
systemctl enable httpd 
systemctl start httpd