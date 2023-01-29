#!/bin/bash
#SBATCH --job-name=pmae-seg
#SBATCH --time=7-00:00
#SBATCH --begin=now
#SBATCH --signal=TERM@120
#SBATCH --mail-user=karim.abou.zeid@rwth-aachen.de
#SBATCH --mail-type=END,FAIL
#SBATCH --output=slurm_logs/%j_%n_%x.txt
# format like node+jobname+user+jobid

# check out examples https://github.com/accre/SLURM
# or this one https://github.com/statgen/SLURM-examples
# https://github.com/cdt-data-science/cluster-scripts

cd segmentation && python main.py --ckpts "../experiments/pretrain/cfgs/downloaded/ckpt-last.pth" --root "../data/shapenetcore_partanno_segmentation_benchmark_v0_normal" --learning_rate 0.0002 --epoch 300 --log_dir "$@"