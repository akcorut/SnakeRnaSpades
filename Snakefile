"""
Author: Kivanc Corut
A Snakemake workflow for performing de novo transcriptome assembly.
"""
import glob
import os
import pandas as pd
from snakemake.io import expand
from snakemake.utils import R
from snakemake.io import glob_wildcards
import re
from os.path import join

configfile: "config.yaml"

raw_data = "/work/jawlab/kivanc/PeanutRnaSeq/data/fastq"
trim_data = "/scratch/ac32082/PeanutRnaSeq/results/trimmed"

sample_id = config["samples"]

rule all:
    input:
        "results/rnaspades/assembly/transcripts.fasta",
        expand("results/kallisto/quant_results_{smp}", smp=sample_id),
        "results/transrate/left.fq.gz",
        "results/transrate/right.fq.gz",
        "results/transrate/transrate_out",
        "results/rnaQUAST/results",
        "results/quast/results",
        "results/salmon/transcriptome_index",
        expand("results/salmon/{smp}/quant.sf", smp=sample_id),
        "results/busco/full_table_busco.tsv",
        "results/multiqc/multiqc_report.html",
        "results/mummer/delta/leaf.delta",
        "results/mummer/plot/leaf.png"


include: "rules/spades.smk"
include: "rules/transrate.smk"
include: "rules/quast.smk"
include: "rules/busco.smk"
include: "rules/kallisto.smk"
include: "rules/salmon.smk"
include: "rules/multiqc.smk"
include: "rules/mummer.smk"