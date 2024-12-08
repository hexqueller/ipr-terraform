#!/bin/bash

rm -rf /var/lib/apt/lists/lock

apt update

apt install nginx -y

rm -rf /var/www/html/*

cat << EOF > /var/www/html/index.html
<h2> Web server created by terraform! </h2>
<h3> This server on ${network} port. </h3>
<h3> Image id is ${image}. </h3>
EOF

service nginx start
