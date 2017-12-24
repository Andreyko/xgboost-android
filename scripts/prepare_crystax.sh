#!/bin/bash

crystax_dir_10_3_2=./crystax-ndk-10.3.2
crystax_dir_latest=./crystax-ndk

crystax_file_10_3_2=crystax-ndk-10.3.2-linux-x86_64.tar.xz
crystax_file_latest=crystax-ndk-b1036-linux-x86_64.tar.xz

crystax_url_10_3_2=https://www.crystax.net/download/$crystax_file_10_3_2
crystax_url_latest=https://dl.crystax.net/builds/1036/$crystax_file_latest

check=($crystax_dir_10_3_2 $crystax_dir_latest $crystax_file_10_3_2 $crystax_file_latest)

cd ..

for path in ${check[*]}
do    
    if [ -f "$path" ] || [ -d "$path" ]
    then
        echo "$path already exists!"
        exit 1
    fi    
done

echo ">>> $crystax_file_10_3_2 : BEGIN : " $(date -u)

wget $crystax_url_10_3_2
tar xvfJ $crystax_file_10_3_2
rm ./$crystax_file_10_3_2

echo ">>> $crystax_file_10_3_2 : END : " $(date -u)

echo ">>> $crystax_file_latest : BEGIN : " $(date -u)

wget $crystax_url_latest
tar xvfJ $crystax_file_latest
rm ./$crystax_file_latest

echo ">>> $crystax_file_latest : END : " $(date -u)
