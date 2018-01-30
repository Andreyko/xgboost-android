#!/bin/bash

if [ $# != 1 ] ; then
    echo "usage $0 ANDROID_ABI"
    exit 1
fi

ANDROID_ABI="$1"

echo ">>> ANDROID_ABI $ANDROID_ABI : BEGIN : $(date -u) <<<"

rm -rf ../xgboost/lib
rm -rf ../xgboost/build
mkdir ../xgboost/build
cd ../xgboost/build

cmake -DCMAKE_TOOLCHAIN_FILE=../crystax-ndk-10.3.2/cmake/toolchain.cmake \
-DANDROID_NDK=../crystax-ndk-10.3.2 \
-DANDROID_TOOLCHAIN_VERSION="5" \
-DANDROID_STL="gnustl_shared" \
-DANDROID_ABI="$ANDROID_ABI" \
-DCMAKE_BUILD_TYPE="Debug" \
-DANDROID_NATIVE_API_LEVEL="19" \
..

make  -j $(nproc)

echo ">>> ANDROID_ABI $ANDROID_ABI : END : $(date -u) <<<"
