#!/bin/bash
dnf update -y
dnf install -y nginx
systemctl enable --now nginx

echo "<h1>Hello from Nginx on EC2! ${env}</h1>" > /usr/share/nginx/html/index.html
F