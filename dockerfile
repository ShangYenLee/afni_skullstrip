FROM afni/afni_make_build:AFNI_22.2.05

USER 0
RUN apt-get update && \
    apt-get install -y python3.7 python3-pip python3.7-dev

USER 1000
RUN pip3 install --upgrade pip && \
    pip3 install nibabel
WORKDIR /home/Develop
COPY . ./
