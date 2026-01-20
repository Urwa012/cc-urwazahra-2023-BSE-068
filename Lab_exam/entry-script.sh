#!/bin/bash
sudo yum update -y && 
sudo yum install -y nginx 
openssl sudo systemctl 
start nginx sudo 
systemctl enable nginx 
sudo mkdir -p 
/etc/nginx/ssl sudo 
openssl req -x509 -nodes 
-days 365 -newkey 
rsa:2048 \
  -keyout 
  /etc/nginx/ssl/nginx.key 
  \ -out 
  /etc/nginx/ssl/nginx.crt 
  \ -subj 
  "/CN=TerraformServer"
sudo cat <<EOF > 
/etc/nginx/conf.d/default.conf 
server {
    listen 80; 
    server_name _; return 
    301 
    https://\$host\$request_uri;
}
server { listen 443 ssl; 
    ssl_certificate 
    /etc/nginx/ssl/nginx.crt; 
    ssl_certificate_key 
    /etc/nginx/ssl/nginx.key; 
    location / {
        root 
        /usr/share/nginx/html; 
        index index.html;
    }
}
EOF echo "<h1> Terraform 
.</h1>" | sudo tee 
/usr/share/nginx/html/index.html
sudo systemctl restart nginx
