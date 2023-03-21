#!/bin/bash

target_file="../background.png"

switch_image() {
	echo "Previously used image: $1"
	echo "New image would be: $2"
	cp "$2" "$target_file"
	echo "New image was copied successfully."
}


images=($(ls -1 *.png))
images_count=${#images[@]};
echo "Total image files: ${images_count}"

first_file=${images[0]}

if [[ ! -f "$target_file" ]]
then
  cp "$first_file" "$target_file"
  echo "There were no ${target_file} present, so ${first_file} was copied into it."
  exit
fi

for i in ${!images[@]}
do
  current_image="${images[$i]}"
  if diff -q "$target_file" "$current_image" > /dev/null
  then
    # Files matched
    next_index=$(( ($i + 1) % $images_count ))
	  next_image="${images[$next_index]}"
    switch_image "$current_image" "$next_image"
	exit
  fi
done

cp "$first_file" "$target_file"
echo "No matching ${target_file} files found, so ${first_file} was copied into it."
