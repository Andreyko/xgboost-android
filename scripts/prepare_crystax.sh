#!/bin/bash

crystax_dir_10_3_2=./crystax-ndk-10.3.2-b919-linux-x86_64
crystax_file_10_3_2=crystax-ndk-10.3.2-b919-linux-x86_64.tar.xz
crystax_url_10_3_2=https://dl.crystax.net/builds/919/linux/$crystax_file_10_3_2

check=($crystax_dir_10_3_2 $crystax_file_10_3_2)

cd ..

for path in ${check[*]}
do
    if [ -f "$path" ] || [ -d "$path" ]
    then
        echo "$path already exists!"
        exit 1
    fi
done

echo ">>> $crystax_file_10_3_2 : BEGIN : $(date -u) <<<"

wget $crystax_url_10_3_2
tar xvfJ $crystax_file_10_3_2
rm ./$crystax_file_10_3_2

echo ">>> $crystax_file_10_3_2 : END : $(date -u) <<<"
