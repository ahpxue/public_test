#!/bin/bash

# Path to script
script_path="pre-push"

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

wget https://raw.githubusercontent.com/ahpxue/public_test/main/public_test/project_setup/pre-push
