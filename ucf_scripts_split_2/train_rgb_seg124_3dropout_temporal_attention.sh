#!/usr/bin/env bash

DATASET=$1

filename=$(date '+%Y%m%d_%H:%M:%S')
echo $filename

TOOLS=lib/caffe-mpi-transpose/build/install/bin
LOG_FILE=logs/${DATASET}_${filename}.log

echo "logging to ${LOG_FILE}"

### /data4/lilin/my_code/ucf101_split_1_rgb_flow_models/ucf101_split_1_rgb_seg124_3dropout_temporal_attention_stage_2_lr_0.01_iter_2400.caffemodel accuracy = 0.85
### /data4/lilin/my_code/ucf101_split_1_rgb_flow_models/ucf101_split_1_rgb_seg124_3dropout_temporal_attention_stage_2_lr_0.001_iter_2100.caffemodel accuracy = 0.877
### /data4/lilin/my_code/ucf101_split_1_rgb_flow_models/ucf101_split_1_rgb_seg124_3dropout_temporal_attention_stage_2_lr_0.0001_iter_600.caffemodel accuracy = 0.881
$TOOLS/caffe train --solver=models/ucf101/rgb_seg124_3dropout_temporal_attention_solver.prototxt  \
   --weights="/data4/lilin/my_code/ucf101_split_1_rgb_flow_models/ucf101_split_1_rgb_seg124_3dropout_temporal_attention_stage_2_lr_0.0001_iter_600.caffemodel"