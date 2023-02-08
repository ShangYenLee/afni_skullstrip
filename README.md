## 3dSkullStrip
skullstrip all `*.nii` `*.nii.gz` files under $input_folder<br>
`bash skullstrip.sh $input_folder`<br> 
## Working on docker container
```
docker pull afni/afni_make_build:AFNI_22.2.05
docker build -t afni/afni_skullstrip:v1 .
bash RUN.sh $input_folder $output_directory
```
> **Warning**
> All files/folders under `$input_folder` shouldn't contain space
