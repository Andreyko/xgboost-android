#!/bin/bash

cd ~/Tools/xgboost/dmlc-core
git diff include/dmlc/base.h > ~/scripts/xgboost_dmlc_core_include_dmlc_base_h.diff
git diff src/io/local_filesys.cc > ~/scripts/xgboost_dmlc_core_src_io_local_filesys.cc.diff
git diff src/io/single_file_split.h > ~/scripts/xgboost_dmlc_core_src_io_single_file_split.h.diff

cd ~/Tools/xgboost/rabit
git diff include/dmlc/base.h > ~/scripts/xgboost_rabit_include_dmlc_base_h.diff
git diff include/rabit/internal/utils.h > ~/scripts/xgboost_rabit_include_rabit_internal_utils_h.diff
