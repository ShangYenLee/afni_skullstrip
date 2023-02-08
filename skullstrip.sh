#!/bin/bash
#$1-->input_folder

function skullstrip(){
   folder=${1%/*}
   folder=${folder#$2}
   filename=${1##*/}
   filename=${filename%%.*}
   mkdir -p ./skullstrip$folder
   space=$(echo $(3dinfo -space $1)|tr [:upper:] [:lower:])
   3dSkullStrip -orig_vol -prefix ./skullstrip/skull -input $1
   3dAFNItoNIFTI -prefix ./skullstrip$folder/${filename}.nii.gz ./skullstrip/skull+$space
   if [ -e ./skullstrip/skull+${space}.BRIK ];then
       rm ./skullstrip/skull+${space}.BRIK
   else 
       rm ./skullstrip/skull+${space}.BRIK.gz
   fi
   rm ./skullstrip/skull+${space}.HEAD
   python3 modTransform.py --orig_dir $1 --sorce_dir ./skullstrip$folder/${filename}.nii.gz
}

#initial setting
if [ ! -d $1 ];then
    echo $1 folder not exist
    exit 1
fi
if [ ! -d ./skullstrip ];then
    mkdir -p ./skullstrip || echo 'Could not create output directory' && exit 2
fi
parent_dir=$(dirname $1)
file_list=$(find $1 -type f -name '*.nii' -o -name '*.nii.gz')
failed_file=()

#Skullstrip
for file in $file_list
do
    skullstrip $file $parent_dir || failed_file+=($file)
done

#list failed file
if [ ${#failed_file[@]} -ne 0 ];then
    echo -e "\033[31mFollowing file(s) processing failed:\033[0m"
    printf '%s\n' "${failed_file[@]}"
fi
