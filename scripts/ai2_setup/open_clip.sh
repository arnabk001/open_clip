#!/bin/bash
source ~/miniconda3/etc/profile.d/conda.sh

conda create --name open_clip python=3.9 -y
conda activate open_clip
git clone https://github.com/krmayankb/open_clip.git
cd open_clip 
git switch mrl_gpu 
pip install -e .