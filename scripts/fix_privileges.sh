#!/usr/bin/env bash

set -e

# Check if the directory exists
if [ ! -d "/home/ec2-user/server" ]; then
  echo "Directory /home/ec2-user/server does not exist. Exiting."
  exit 1
fi

# Change ownership (if required) and permissions
sudo chown -R ec2-user:ec2-user /home/ec2-user/server
sudo chmod -R +x /home/ec2-user/server

# Change permissions for specific files if they exist
if [ -f "/home/ec2-user/server_start.sh" ]; then
  sudo chmod +x /home/ec2-user/server_start.sh
else
  echo "File /home/ec2-user/server_start.sh not found. Exiting."
  exit 1
fi

if [ -f "/home/ec2-user/server_stop.sh" ]; then
  sudo chmod +x /home/ec2-user/server_stop.sh
else
  echo "File /home/ec2-user/server_stop.sh not found. Exiting."
  exit 1
fi

# Adjust permissions for JAR files
if ls /home/ec2-user/*.jar 1> /dev/null 2>&1; then
  sudo chmod +x /home/ec2-user/*.jar
else
  echo "No JAR files found in /home/ec2-user."
fi

echo "Permissions fixed successfully."
