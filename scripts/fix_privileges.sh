#!/usr/bin/env bash

set -e

# Check if the directory exists
if [ ! -d "/home/ec2-user/server" ]; then
  echo "Directory /home/ec2-user/server does not exist. Skipping directory-related operations."
else
  # Change ownership and permissions for the directory
  sudo chown -R ec2-user:ec2-user /home/ec2-user/server
  sudo chmod -R +x /home/ec2-user/server
fi

# Change permissions for specific files if they exist
if [ -f "/home/ec2-user/server_start.sh" ]; then
  sudo chmod +x /home/ec2-user/server_start.sh
else
  echo "Warning: File /home/ec2-user/server_start.sh not found."
fi

if [ -f "/home/ec2-user/server_stop.sh" ]; then
  sudo chmod +x /home/ec2-user/server_stop.sh
else
  echo "Warning: File /home/ec2-user/server_stop.sh not found."
fi

# Adjust permissions for JAR files
if ls /home/ec2-user/*.jar 1> /dev/null 2>&1; then
  sudo chmod +x /home/ec2-user/*.jar
else
  echo "Warning: No JAR files found in /home/ec2-user."
fi

echo "Permissions fixed successfully."
