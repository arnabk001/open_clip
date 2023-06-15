cd /mmfs1/gscratch/krishna/mayank/clip_clone/open_clip/src
torchrun --nproc_per_node 2 --master_port 2345 -m training.main \
    --model "ViT-B-16" \
    --train-data "/mmfs1/data/yfcc-tmp/cc_3m/train_shards/shard_{000000..003318}.tar" \
    --imagenet-val "/mmfs1/data/yfcc-tmp/imagenet/val/" \
    --dataset-type webdataset \
    --precision amp \
    --gather-with-grad \
    --local-loss \
    --svd_cosinereg 0.05 \
    --batch-size 256 \
    --accum-freq 2 \
    --workers 4 \
    --epochs 40 \
    --warmup 2000 \
    --zeroshot-frequency 2 \
    --seed 0 \
    --report-to 'wandb' \
    --wandb-project-name "clip_svd_training" \
    --logs "/mmfs1/gscratch/krishna/mayank/clip_clone/open_clip/src/logs/clip_svd" \
    --name "clip_svd_b256_accum_2_ep40_reg0.05_normaldist_false_v2" 
    # --normal_dist_var 0.25 \
    # --apply_normal_dist \
    # --name "clip_svd_b256_accum_2_ep40_reg0.001_normaldist_false_v1" 