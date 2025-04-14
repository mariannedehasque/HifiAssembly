#!/bin/bash -l
#SBATCH -A naiss2024-22-1281
#SBATCH -p core -n 16
#SBATCH -J HIFIASM
#SBATCH -t 10-00:00:00

module load bioinfo-tools hifiasm/0.20.0-r639

OUTDIR="/proj/snic2020-2-10/private/Analyses/marianne/GIT/Mouflon/pacbio_hifi_assembly/workflow/results/hifiasm_output_RAW"
INPUT="/proj/snic2020-2-10/private/Analyses/marianne/GIT/Mouflon/pacbio_hifi_assembly/workflow/results/hifiasm_output_RAW/Bonassai005.filt.fastq.gz"
SAMPLE="Bonassai005"

# Purge level light
hifiasm -t 16 -l1 -o ${OUTDIR}/${SAMPLE} ${INPUT}