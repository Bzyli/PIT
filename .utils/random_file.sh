#!/bin/bash
path="$(dirname "$(realpath $0)")"

random_files=()
for ((i=0; i<6; i++)); do
    depth=(5 6 7 8)
    MAX_DEPTH="${depth[RANDOM % ${#depth[@]}]}"

    ROOT_DIR=$path/"../super_secure_network"
    echo $ROOT_DIR
    #find files at depth
    files_at_max_depth=$(find "$ROOT_DIR" -type f -path "$(printf "*/%.0s" $(seq 1 $MAX_DEPTH))*" 2>/dev/null)

    # Convert the list of files to an array
    files=($files_at_max_depth)

    # Select a random file from the array
    random_file="${files[RANDOM % ${#files[@]}]}"

    #echo "Random file at max depth $MAX_DEPTH: $random_file"
    random_files+=($random_file)
done
printf '%s\n' "${random_files[@]}" > $path/temp/machines
