#!/bin/bash

# Define the source and destination directories
source_dir="."
dest_dir="../mirrored_sankey"

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

count_particles() {
    local file=$1
    local relative_path="${file#$source_dir/}"
    local dir_path="${file%/*}/"
    echo "File" $file $relative_path $dir_path
    local dest_file="$dest_dir/${dir_path}/sankey.csv"

    grep MotionCorr "$file" | awk '{print $7}' | sort | uniq -c | awk '{printf "%d,%s\n", $1,$2}' > "$dest_file"
}

# Copy files with Refine3D
echo "Copying files with extension 'star':"
paths="./Refine3D/ ./Class3D ./InitialModel"
#find  $paths -name "run_it*_data.star" -type f -print | sort | awk -F/ -f max_index.awk | while read -r file; do
#    echo "Copying $file"
#    copy_to_mirrored_tree "$file"
#    count_particles "$file"
#done

ls Refine3D | while read -r file; do 
    echo "Extracting $file"
    find ./Refine3D/${file} -name run_it*_data.star -print | sort | tail -1 | while read -r data_file; do 
        echo $data_file
        copy_to_mirrored_tree "$data_file"
        count_particles "$data_file"
    done
done


# Copy files with 'particles.star'
echo "Copying files with extension 'star':"
ls **/* | find  -name "particles.star" -maxdepth 3 -type f -print | while read -r file; do
    echo "Copying $file"
    copy_to_mirrored_tree "$file"
    count_particles "$file"
done




# Copy files beginning with 'run_it<num>.' where <num> is the greatest number
echo -e "\nCopying files beginning with 'run_it<num>.' where <num> is the greatest number ($greatest_num):"
find .Nodes/ ! -type d | awk -F'/' '{print $(NF-2)"/"$(NF-1)"/"$NF}' | while read -r file; do
    echo "Copying $file"
    copy_to_mirrored_tree "$file"
    if [[ "$file" == *"run"* ]]; then
        pattern=$(echo ${file} | grep -o ".*run_it[0-9]*")
        for relion_file in  ${pattern}*; do
           echo "$relion_file"
            #copy_to_mirrored_tree  "$relion_file" 
            if [[ "$relion_file" == *"data"* ]]; then
                count_particles $relion_file
                echo "yes"
            else
                echo "no"
            fi
            
        done 
    fi
done


echo "Files copied to mirrored tree in $dest_dir"
