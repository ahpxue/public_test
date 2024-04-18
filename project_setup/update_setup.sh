#!/bin/bash

echo "This is update script for project repo, version 1.1"
echo "$(pwd)"
# Path to script
script_path="../../hooks/pre-push"

# Check if script is running
# Use pgrep to find the process ID of script
script_pid=$(pgrep -f "$script_path")

# If script is running, terminate it gracefully
if [ -n "$script_pid" ]; then
    # Send SIGTERM to terminate script
    kill "$script_pid"

    # Wait for script to terminate
    sleep 2
fi

# Backup the original script
cp "$script_path" "$script_path.bak"

wget https://raw.githubusercontent.com/ahpxue/public_test/main/project_setup/pre-push -O ../../hooks/pre-push
