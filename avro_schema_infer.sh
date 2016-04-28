#!/usr/bin/env bash
BASE_DIR=$1
CLASS=$2
INPUT_DIR=${BASE_DIR}/input
OUTPUT_DIR=${BASE_DIR}/output

# preparation
rm -rf ${OUTPUT_DIR}; mkdir -p ${OUTPUT_DIR}

# run kite-dataset
all_files=`ls ${INPUT_DIR}`
for file in ${all_files}
do
    /tools/kite-dataset json-schema ${INPUT_DIR}/$file -o ${OUTPUT_DIR}/$file.avsc --class ${CLASS}
done