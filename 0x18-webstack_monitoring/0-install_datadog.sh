#!/usr/bin/env bash
# This script installs the Datadog agent on web-01

# Add Datadog repository key
DD_KEY_URL="https://yum.datadoghq.com/DATADOG_RPM_KEY.public"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7D19F1F3

# Add Datadog repository
echo "deb https://apt.datadoghq.com/ stable 7" | sudo tee /etc/apt/sources.list.d/datadog.list

# Update package lists
sudo apt-get update

# Install Datadog agent
sudo apt-get install datadog-agent -y
