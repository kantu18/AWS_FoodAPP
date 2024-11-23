#!/usr/bin/env bash

# Ensure all commands stop execution if an error occurs
set -e

# Ensure the directory exists
if [ ! -d "/home/ec2-user/server" ]; then
  echo "Directory /home/ec2-user/server does not exist. Exiting."
  exit 1
fi

# Change permissions for all files in the directory
chmod -R +x /home/ec2-user/server

# Ensure the required files exist before changing permissions
if [ -f "/home/ec2-user/server_start.sh" ]; then
  chmod +x /home/ec2-user/server_start.sh
else
  echo "File /home/ec2-user/server_start.sh not found. Exiting."
  exit 1
fi

if [ -f "/home/ec2-user/server_stop.sh" ]; then
  chmod +x /home/ec2-user/server_stop.sh
else
  echo "File /home/ec2-user/server_stop.sh not found. Exiting."
  exit 1
fi

# Adjust permissions for any JAR files in the directory
if ls /home/ec2-user/*.jar 1> /dev/null 2>&1; then
  chmod +x /home/ec2-user/*.jar
else
  echo "No JAR files found in /home/ec2-user."
fi

echo "Permissions fixed successfully."
