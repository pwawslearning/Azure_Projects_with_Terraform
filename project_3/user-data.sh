#!/bin/bash
# Update packages
apt-get update -y

# Install Apache
apt-get install -y apache2

# Enable and start Apache
systemctl enable apache2
systemctl start apache2

# Create a sample HTML page
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to My Azure VM</title>
</head>
<body style="font-family: Arial, sans-serif; text-align: center; margin-top: 50px;">
    <h1>Hello from Azure VM!</h1>
    <p>This is a sample HTML website deployed using cloud-init (custom-data).</p>
</body>
</html>
EOF