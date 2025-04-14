#!/bin/bash -l
#SBATCH -A naiss2024-22-1281
#SBATCH -p core -n 16
#SBATCH -J busco
#SBATCH -t 4-00:00:00

ml bioinfo-tools
#ml BUSCO/5.7.1
#module unload hmmer
#ml hmmer/3.3.2 #hmmer/3.4 seems to be misconfigured with BUSCO/5.7.1. Reload old version.
ml BUSCO/5.3.1 #hmmer/3.2.1 included in this version

FILE="/proj/snic2020-2-10/private/Analyses/marianne/GIT/Mouflon/pacbio_hifi_assembly/workflow/results/assembly/ragtag_output/ragtag.scaffold.fasta"
OUT="Bonassai005.ragtag.busco.cetartiodactyla_odb10"
DIR="/proj/snic2020-2-10/private/Analyses/marianne/GIT/Mouflon/pacbio_hifi_assembly/workflow/results/assembly/qc/Bonassai005.busco"

cd $DIR

#busco -i $FILE -l $BUSCO_LINEAGE_SETS/cetartiodactyla_odb10 -m genome -o ${OUT} -f -c 16
run_BUSCO.py -i $FILE -l $BUSCO_LINEAGE_SETS/cetartiodactyla_odb10 -m genome -o ${OUT} -f -c 16
