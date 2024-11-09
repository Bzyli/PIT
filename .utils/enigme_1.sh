#!/bin/bash

# Directory for the log files
LOG_DIR="fake_logs"
ARCHIVE_NAME="communication_logs.tar.gz"
ROOT_DIR=$(pwd | awk -F'super_secure_network' '{print $1}')

# Ensure the log directory exists
mkdir -p "$LOG_DIR"

# Define the two computers (e.g., ComputerA and ComputerB)
COMPUTER_A="$(basename $(head -n 1 $ROOT_DIR/.utils/temp/machines))"
COMPUTER_B="$(basename $(sed -n '2p' $ROOT_DIR/.utils/temp/machines))"

# Number of log entries to generate
NUM_ENTRIES=180

generate_random_name() {
    tr -dc 'a-zA-Z0-9' </dev/urandom | head -c 20
}

# Function to generate fake log entries
generate_logs() {
    local file=$1
    local sender=$2
    local receiver=$3

    for i in $(seq 1 $NUM_ENTRIES); do
        # Timestamp for each log entry
        TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S" -d "$((RANDOM % 30)) min ago")
        # Fake message
        MESSAGE="Log entry $i: $sender to $receiver - Message $(generate_random_name)"

        # Append to log file
        echo "[$TIMESTAMP] $MESSAGE" >> "$file"
    done
}

# Generate fake logs for both direction
generate_logs "$LOG_DIR/log_$(date +"%Y-%m-%d_%H:%M:%S" -d "$((RANDOM % 30)) min ago")" "$COMPUTER_A" "$COMPUTER_B"
generate_logs "$LOG_DIR/log_$(date +"%Y-%m-%d_%H:%M:%S" -d "$((RANDOM % 30)) min ago")" "$COMPUTER_A" "$COMPUTER_B"
generate_logs "$LOG_DIR/log_$(date +"%Y-%m-%d_%H:%M:%S" -d "$((RANDOM % 30)) min ago")" "$COMPUTER_A" "$COMPUTER_B"
generate_logs "$LOG_DIR/log_$(date +"%Y-%m-%d_%H:%M:%S" -d "$((RANDOM % 30)) min ago")" "$COMPUTER_A" "$COMPUTER_B"
generate_logs "$LOG_DIR/log_$(date +"%Y-%m-%d_%H:%M:%S" -d "$((RANDOM % 30)) min ago")" "$COMPUTER_A" "$COMPUTER_B"
generate_logs "$LOG_DIR/log_$(date +"%Y-%m-%d_%H:%M:%S" -d "$((RANDOM % 30)) min ago")" "$COMPUTER_A" "$COMPUTER_B"
generate_logs "$LOG_DIR/log_$(date +"%Y-%m-%d_%H:%M:%S" -d "$((RANDOM % 30)) min ago")" "$COMPUTER_A" "$COMPUTER_B"
# Create the tar.gz archive
tar -czf "$ARCHIVE_NAME" -C "$LOG_DIR" .

# Clean up log files
rm -r "$LOG_DIR"
