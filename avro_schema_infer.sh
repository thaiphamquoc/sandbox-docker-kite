#!/usr/bin/env bash
SCRIPTS_DIR="`cd $( dirname ${BASH_SOURCE[0]} ) && pwd`"
BASE_DIR='/data/discovery/avro'
INPUT_DIR=${BASE_DIR}/input
OUTPUT_DIR=${BASE_DIR}/output

# preparation
rm -rf ${OUTPUT_DIR}; mkdir -p ${OUTPUT_DIR}
if [ $# -gt 0 ]
then
    rm -rf ${INPUT_DIR}; mkdir -p ${INPUT_DIR}
    # split the bi events upon event_id
    php /projects/bi_discovery/scripts/php/split_json_bievent.php --input=$1
fi

# run kite-dataset
all_files=`ls ${INPUT_DIR}`
for file in ${all_files}
do
    /tools/kite-dataset json-schema ${INPUT_DIR}/$file -o ${OUTPUT_DIR}/$file.avsc --class bievent
done