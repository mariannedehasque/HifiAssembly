# PacBio_hifi_assembly
This pipeline automates via snakemake the genome assembly of PacBio HiFi reads using Hifiasm and scaffolding using RagTag. 

The pipeline is a modified version from the harvardinformatics pipeline (https://github.com/harvardinformatics/pacbio_hifi_assembly.git) and was developed to run on the RACKHAM cluster on UPPMAX (https://www.uu.se/en/centre/uppmax). Modules and computational partitions may need to be modified for different cluster systems.

## Configuring the pipeline  
In the repo directory, there is a file in the `config/` subdirectory called `config.yaml` that you will need to modify to point towards your data. For a basic assembly, just change the following lines: 

```
sample: "sample_name"  #Name of the sample to act as base name
reads: " "  #List of BAM files output from sequencer (include full path). If multiple files, separate by SPACES
assembly_guide: " " #Path to reference assembly used to guide scaffolding
```

You do not need to change any other options in `config/config.yaml` unless you are incorporating HiC data (note this is NOT the same as scaffolding with HiC!) or only want a primary assembly.  

## Running the pipeline 

Load modules and export python path

```$ module load bioinfo-tools snakemake/5.4.5```

```$ export LD_LIBRARY_PATH=/sw/comp/python/3.6.0_rackham/lib```


From the main directory, navigate into the `workflow/` subdirectory, which contains the `Snakefile` that determines the order in which the pipeline runs. 

## Activate tmux
The pipeline has to be run using a terminal multiplexer like tmux or screen to be able to send the Snakemake process to the background (e.g. see this introduction to tmux).
To run tmux:
`tmux new -s "session"` new session
`tmux a -t "session"` reopen old session

Note: One does not simply exit tmux.

## Dry run
snakemake -npr -j 999 --use-conda --cluster-config ../config/resources.yaml --cluster "sbatch -A {cluster.account} -p {cluster.partition} -n {cluster.ntasks} -t {cluster.time}" &> dry_run.out

## Main run
snakemake -j 999 --use-conda --cluster-config ../config/resources.yaml --cluster "sbatch -A {cluster.account} -p {cluster.partition} -n {cluster.ntasks} -t {cluster.time}" &> 241111_main.out
