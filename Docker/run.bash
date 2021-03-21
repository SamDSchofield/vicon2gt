#!/bin/bash


docker run \
  -it \
  --rm \
  --net=host \
  -v "${4}:/bags" \
  vicongt \
  /bin/bash -i -c "source ~/.bashrc && roslaunch vicon2gt exp_${1}.launch dataset:=${2} gt_topic:=${3}"
