## 3dSkullStrip
skullstrip all `*.nii` `*.nii.gz` files under $input_folder<br>
`bash skullstrip.sh $input_folder`
## Working on docker container
```
docker pull afni/afni_make_build:AFNI_22.2.05<br>
docker build -t afni/afni_skullstrip:v1 .
docker run \
    --rm \
    -v $input_folder:/home/Develop/input:ro \
    -v $output_folder:/home/Develop/skullstrip:rw \
    --user $(id -u):$(id -g) \
    afni/afni_skullstrip:v1 \
    bash skullstrip.sh /home/Develop/input
```
