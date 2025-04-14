#!/bin/bash -l
#SBATCH -A naiss2024-22-1281
#SBATCH -p core -n 8
#SBATCH -J jellyfish
#SBATCH -t 1-00:00:00

module load bioinfo-tools jellyfish/2.3.0

DIR="/crex/proj/snic2020-2-10/private/Analyses/marianne/GIT/Mouflon/pacbio_hifi_assembly/workflow/results/qc"
FASTQGZ="/proj/snic2020-2-10/private/Analyses/marianne/GIT/Mouflon/pacbio_hifi_assembly/workflow/results/hifiasm_output_RAW/Bonassai005.filt.fastq.gz"
FASTA="/proj/snic2020-2-10/private/Analyses/marianne/GIT/Mouflon/pacbio_hifi_assembly/workflow/results/hifiasm_output_RAW/Bonassai005.filt.fastq"

NAME="Bonassai005"

gunzip $FASTQGZ

jellyfish count -C -m 21 -s 1G -t 2 $FASTA -o $DIR/${NAME}.jf 
jellyfish histo $DIR/${NAME}.jf > $DIR/${NAME}.histo