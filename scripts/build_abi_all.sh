#!/bin/bash

rm -rf ../libs
mkdir ../libs

all_abi=(armeabi armeabi-v7a armeabi-v7a+neon armeabi-v7a+vfpv3 armeabi-v7a-hard armeabi-v6+vfp x86 mips arm64-v8a x86_64 mips64)
lib_file="../xgboost/lib/libxgboost.so"

for abi in ${all_abi[*]}
do
    ./build_abi_one.sh $abi
    
    if [ -f "$lib_file" ]
    then
        dst_path="../libs/$abi"
        echo "$lib_file -> $dst_path"
        mkdir "$dst_path"
        cp "$lib_file" "$dst_path"
    else
        echo "Error: $abi was not built!"
    fi    
done
