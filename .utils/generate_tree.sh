#!/bin/bash

# Parameters: depth and width of the directory tree
MAX_DEPTH=8      # Maximum depth of the tree
MAX_BRANCHES=6   # Maximum number of directories/files per level

# Function to generate a random name
generate_random_name() {
    tr -dc 'a-zA-Z0-9' </dev/urandom | head -c 20
}

# Recursive function to generate the directory tree
generate_tree() {
    local current_depth=$1
    local current_dir=$2

    # Stop if max depth is reached
    if (( current_depth >= $MAX_DEPTH )); then
      echo "echo Raté, ce n'est pas la bonne machine ... " > "$current_dir/machine_$(generate_random_name).sh"
      return
    fi

    # Generate random number of items (directories and filesi)
    num_items=$((1 + $RANDOM % $MAX_BRANCHES))

    for (( i=0; i<num_items; i++ )); do
        item_name=$(generate_random_name)

        mkdir -p "$current_dir/$item_name"
        generate_tree $(( current_depth + 1 )) "$current_dir/$item_name" &
    done
}

# Create the root directory
ROOT_DIR="../super_secure_network"
mkdir -p "$ROOT_DIR"

# Start generating the tree from the root
generate_tree 1 "$ROOT_DIR"

echo "Directory tree created in $ROOT_DIR"
