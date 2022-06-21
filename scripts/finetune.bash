#!/bin/bash
#SBATCH --cpus-per-task=8
#SBATCH --mem=48G
#SBATCH --gres=gpu:2
#SBATCH --job-name=pmae-fine
#SBATCH --time=1-00:00
#SBATCH --partition=trtx-lo
#SBATCH --begin=now
#SBATCH --signal=TERM@120
#SBATCH --mail-user=karim.abou.zeid@rwth-aachen.de
#SBATCH --mail-type=END,FAIL
#SBATCH --output=slurm_logs/%j_%n_%x.txt
# format like node+jobname+user+jobid

# check out examples https://github.com/accre/SLURM
# or this one https://github.com/statgen/SLURM-examples
# https://github.com/cdt-data-science/cluster-scripts

python main.py --config cfgs/finetune_modelnet.yaml --finetune_model --exp_name "$1" --ckpts experiments/pretrain/cfgs/"$1"/ckpt-last.pth --resume