#!/bin/bash

# Define the source and destination directories
source_dir="."
dest_dir="../mirrored_tree"

# Create the mirrored directory
mkdir -p "$dest_dir"

# Function to maintain directory structure and copy files
copy_to_mirrored_tree() {
    local file=$1
    local relative_path="${file#$source_dir/}"
    local dest_file="$dest_dir/${relative_path%/*}"
    mkdir -p "$dest_file"
    cp "$file" "$dest_file"
}

# Copy files with extension 'star'
echo "Copying files with extension 'star':"
ls **/* | find  -name "[job|def]*.star" -maxdepth 3 -type f -print | while read -r file; do
    echo "Copying $file"
    copy_to_mirrored_tree "$file"
done

# Copy files 'note.txt'
echo -e "\nCopying files 'note.txt':"
find "$source_dir" -maxdepth 3 -type f -name "note.txt" | while read -r file; do
    echo "Copying $file"
    copy_to_mirrored_tree "$file"
done

# Copy files beginning with 'run.'
echo -e "\nCopying files beginning with 'run.':"
find "$source_dir" -maxdepth 3 -type f -name "run.*" | while read -r file; do
    echo "Copying $file"
    copy_to_mirrored_tree "$file"
done


# Copy files beginning with 'run_it<num>.' where <num> is the greatest number
echo -e "\nCopying files beginning with 'run_it<num>.' where <num> is the greatest number ($greatest_num):"
find .Nodes/ ! -type d | awk -F'/' '{print $(NF-2)"/"$(NF-1)"/"$NF}' | while read -r file; do
    echo "Copying $file"
    copy_to_mirrored_tree "$file"
    if [[ "$file" == *"run"* ]]; then
        pattern=$(echo ${file} | grep -o ".*run_it[0-9]*")
        for relion_file in  ${pattern}*; do
           echo "Copying $relion_file"
            copy_to_mirrored_tree  "$relion_file"
        done 
    fi
done

echo "Files copied to mirrored tree in $dest_dir"
