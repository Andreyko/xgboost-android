#!/bin/bash

if [ $# != 1 ] ; then
    echo "usage $0 ANDROID_ABI"
    exit 1
fi

ANDROID_ABI="$1"

echo ">>> ANDROID_ABI $ANDROID_ABI : BEGIN : " $(date -u)

rm -rf ../xgboost/lib
rm -rf ../xgboost/build
mkdir ../xgboost/build
cd ../xgboost/build

cmake -DCMAKE_TOOLCHAIN_FILE=pwd/../../crystax-ndk/cmake/toolchain.cmake -DANDROID_NDK=pwd/../../crystax-ndk-10.3.2 -DANDROID_TOOLCHAIN_VERSION="5" -DANDROID_ABI="$ANDROID_ABI" ..

make

echo ">>> ANDROID_ABI $ANDROID_ABI : END : " $(date -u)
