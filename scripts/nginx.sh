#!/bin/bash

rm -rf /var/lib/apt/lists/lock

apt update

apt install nginx -y

rm -rf /var/www/html/*

cat << EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terraform Webpage</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            background-image: url(${background_image});
            background-size: cover;
            background-position: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: white;
            font-family: Arial, sans-serif;
            text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.7);
        }

        h1 {
            font-size: 3rem;
            margin: 0;
        }

        h2 {
            font-size: 2rem;
            margin: 10px 0 0;
        }
    </style>
</head>
<body>
    <h1>Created by Terraform</h1>
    <h2>${server_name} on ${network}</h2>
</body>
</html>
EOF

service nginx start
