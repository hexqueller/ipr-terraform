#!/bin/bash

rm -rf /var/lib/apt/lists/lock

apt update

apt install nginx -y

rm -rf /var/www/html/*

cat << EOF > /var/www/html/index.html
<h2> Web server created by terraform! </h2>
EOF

service nginx start