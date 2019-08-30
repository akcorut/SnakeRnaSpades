rule kallisto_index:
    input:
        "rnaspades/assembly/transcripts.fasta"
    output:
        "results/kallisto/transcripts.idx"
    log:
        "results/kallisto/logs/index.log"
    conda:
        "envs/kallisto.yaml"
    shell:
        "kallisto index -i {output} {input} 2> {log}"

rule kallisto_quant:
    input:
        fastq = ["/scratch/ac32082/PeanutRnaSeq/results/trimmed/{smp}_R1_val_1.fq.gz", "/scratch/ac32082/PeanutRnaSeq/results/trimmed/{smp}_R2_val_2.fq.gz"],
        index = "results/kallisto/transcripts.idx"
    output:
        directory("results/kallisto/quant_results_{smp}")
    params:
        extra = ""
    log:
        "results/kallisto/logs/kallisto_quant_{smp}.log"
    threads: 1
    wrapper:
        "0.36.0/bio/kallisto/quant"