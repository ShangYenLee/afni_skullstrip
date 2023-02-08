#!/bin/bash
sorce=$(readlink -f $1)
out_dir=$(readlink -f $2)
parent_dir=$(dirname $sorce)
sorce_folder=${sorce#$parent_dir}
docker run \
--rm \
-v $sorce:/home/Develop/$sorce_folder:ro \
-v "$out_dir":/home/Develop/skullstrip:rw \
--user $(id -u):$(id -g) \
afni/afni_test:v2 \
bash ./skullstrip_t1cet2.sh .$sorce_folder
