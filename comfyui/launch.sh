#!/bin/bash
export LD_LIBRARY_PATH=/opt/rocm/lib:$LD_LIBRARY_PATH
export PYTORCH_TUNABLEOP_ENABLED=1
export TORCH_ROCM_AOTRITON_ENABLE_EXPERIMENTAL=1
export HSA_OVERRIDE_GFX_VERSION=12.0.0
export GPU_MAX_ALLOC_PERCENT=100
export GPU_MAX_SINGLE_ALLOC_PERCENT=100

source ~/venvs/comfy/bin/activate
cd ~/ComfyUI
python main.py --use-pytorch-cross-attention "$@"
