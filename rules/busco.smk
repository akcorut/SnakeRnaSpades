rule busco:
    input:
        "rnaspades/assembly/transcripts.fasta",
    output:
        "results/busco/full_table_busco.tsv"
    log:
        "results/busco/logs/transcriptome_busco.log"
    threads: 8
    params:
        mode="transcriptome",
        lineage_path="/work/jawlab/kivanc/PeanutRnaSeq/busco/embryophyta_odb10",
        extra=""
    wrapper:
        "0.36.0/bio/busco"