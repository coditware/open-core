#!/bin/bash
set -e
DIR=$(dirname ${BASH_SOURCE[0]})

directory_list=($(ls -d */))

number_of_directories=${#directory_list[@]}
echo "Number of directories: ${#directory_list[@]}"

for directory in ${directory_list[@]}; do
    echo -e "  - ${directory}"
    ${directory}/deploy.sh
done

# for ((i=0; i<number_of_directories; i++)); do
#     echo -e "  - Directory ${i}: ${directory_list[$i]}"
#     ${directory_list[$i]}/deploy.sh
# done
