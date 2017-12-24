#!/bin/bash

xgboost="../xgboost"

if [ -d "$xgboost" ]
then
    echo "$xgboost already exists!"
    exit 1
fi

echo ">>> XGBOOST : BEGIN : " $(date -u)

git clone --recursive https://github.com/dmlc/xgboost "$xgboost"

cd ../xgboost/dmlc-core

git apply ../../scripts/diff/xgboost_dmlc_core_include_dmlc_base_h.diff
git apply ../../scripts/diff/xgboost_dmlc_core_src_io_local_filesys.cc.diff
git apply ../../scripts/diff/xgboost_dmlc_core_src_io_single_file_split.h.diff

cd ../rabit

git apply ../../scripts/diff/xgboost_rabit_include_dmlc_base_h.diff
git apply ../../scripts/diff/xgboost_rabit_include_rabit_internal_utils_h.diff

echo ">>> XGBOOST : END : " $(date -u)
