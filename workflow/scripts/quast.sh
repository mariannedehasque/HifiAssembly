#!/bin/bash -l
#SBATCH -A naiss2024-22-1281
#SBATCH -p core -n 1
#SBATCH -J quast
#SBATCH -t 08:00:00

module load bioinfo-tools quast/5.0.2

quast.py --eukaryote -o ../qc/Bonassai005.p_ctg.quast Bonassai005.bp.p_ctg.fa