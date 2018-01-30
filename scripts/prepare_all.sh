#!/bin/bash

echo ">>> PREPARE ALL : BEGIN : $(date -u) <<<"

./prepare_xgboost.sh
./prepare_crystax.sh

echo ">>> PREPARE ALL : END : $(date -u) <<<"

