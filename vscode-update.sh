#!/bin/bash

# Script to automate the upgrade of Visual Studio Code on Ubuntu

# Download the latest version of VS Code
echo "Downloading the latest version of Visual Studio Code..."
curl -L -o vscode_latest.deb https://go.microsoft.com/fwlink/?LinkID=760868

# Check if the download was successful
if [ $? -ne 0 ]; then
  echo "Failed to download Visual Studio Code. Please check your internet connection."
  exit 1
fi

# Verify the downloaded file is a valid .deb package
if ! file vscode_latest.deb | grep -q 'Debian binary package'; then
  echo "The downloaded file is not a valid .deb package."
  rm vscode_latest.deb
  exit 1
fi

# Install the downloaded package
echo "Installing the latest version of Visual Studio Code..."
sudo dpkg -i vscode_latest.deb

# Handle any dependency issues
if [ $? -ne 0 ]; then
  echo "Fixing any dependency issues..."
  sudo apt-get install -f -y
fi

# Clean up
echo "Cleaning up..."
rm vscode_latest.deb

echo "Visual Studio Code has been successfully upgraded."

