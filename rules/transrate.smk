rule merge_fq:
    input:
        left=expand("/scratch/ac32082/PeanutRnaSeq/results/trimmed/{smp}_R1_val_1.fq.gz", smp=sample_id),
        right=expand("/scratch/ac32082/PeanutRnaSeq/results/trimmed/{smp}_R2_val_2.fq.gz", smp=sample_id)
    output:
        left_out="results/transrate/left.fq.gz",
        right_out="results/transrate/right.fq.gz"
    shell:
        """
        cat {input.left} > {output.left_out}

        cat {input.right} > {output.right_out}
        """

rule transrate:
    input:
        fasta="results/rnaspades/assembly/transcripts.fasta",
        left="results/transrate/left.fq.gz",
        right="results/transrate/right.fq.gz"
    output:
        directory("results/transrate/transrate_out")
    log:
        "results/transrate/logs/transrate.log"
    threads: 8
    shell:
        """
        module load Transrate/1.0.3

        transrate --assembly={input.fasta} --left={input.left} --right={input.right} --output {output} --threads {threads} > {log}
        """