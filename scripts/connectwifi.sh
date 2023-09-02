#!/bin/bash

# Get the network name from the user
printf "Enter the network name:" ;read ssid

# Get the network password from the user
printf "Enter the network password:" ; read password

# Connect to the network
nmcli device wifi connect "$ssid" password "$password"

# Check if the connection was successful
if nmcli device status | grep -q "connected"; then
  echo "Successfully connected to the network $ssid"
else
  echo "Failed to connect to the network $ssid"
fi