#!/bin/bash -l
#SBATCH -A naiss2024-22-1281
#SBATCH -p core -n 1
#SBATCH -J HIFIASM
#SBATCH -t 01:00:00

OUTDIR="/proj/snic2020-2-10/private/Analyses/marianne/GIT/Mouflon/pacbio_hifi_assembly/workflow/results/hifiasm_output_RAW"
SAMPLE="Bonassai005"

for haplo in p_ctg hap1.p_ctg hap2.p_ctg
do
    INPUT="${SAMPLE}.bp.${haplo}.gfa"
    OUTPUT="${SAMPLE}.bp.${haplo}.fa"
    
    awk '/^S/{print ">"$2; print $3}' "$OUTDIR/${INPUT}" > "$OUTDIR/${OUTPUT}"
done
