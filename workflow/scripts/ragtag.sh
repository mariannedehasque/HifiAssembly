#!/bin/bash -l
#SBATCH -A naiss2024-22-1281
#SBATCH -p core -n 4
#SBATCH -J RAGTAG
#SBATCH -t 08:00:00

source /home/marideha/miniconda3/bin/activate ragtag

ml bioinfo-tools python/3.5.0

OUTDIR="/proj/snic2020-2-10/private/Analyses/marianne/GIT/Mouflon/pacbio_hifi_assembly/workflow/results/assembly"
QUERY="/proj/snic2020-2-10/private/Analyses/marianne/GIT/Mouflon/pacbio_hifi_assembly/workflow/results/hifiasm_output_RAW/Bonassai005.bp.p_ctg.fa"
REFERENCE="/crex/proj/snic2020-2-10/private/Data/Non-Human/Animals/sheep/ref_seqs/ARS-UI_Ramb_v3.0/GCF_016772045.2_ARS-UI_Ramb_v3.0_genomic.fna.gz"

cd $OUTDIR

ragtag.py scaffold $REFERENCE $QUERY
