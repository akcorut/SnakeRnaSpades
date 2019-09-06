rule nucmer:
    input:
        fasta="results/rnaspades/assembly/transcripts.fasta",
        ref="/work/jawlab/kivanc/PeanutRnaSeq/reference/arahy.Tifrunner.gnm1.KYV3.genome_main.fa"
    output:
        "results/mummer/delta/leaf.delta"
    conda:
        "../envs/mummer.yaml"
    threads:8
    params:
        prefix="results/mummer/delta/leaf"
    shell:
        """
        nucmer --threads={threads} -c 100 --prefix={params.prefix} {input.ref} {input.fasta}
        """

rule mummerplot:
    input:
        delta="results/mummer/delta/leaf.delta",
        fasta="results/rnaspades/assembly/transcripts.fasta",
        ref="/work/jawlab/kivanc/PeanutRnaSeq/reference/arahy.Tifrunner.gnm1.KYV3.genome_main.fa"
    output:
        "results/mummer/plot/leaf.png"
    conda:
        "../envs/mummer.yaml"
    threads:8
    params:
        prefix="results/mummer/plot/leaf"
    shell:
        """
        mummerplot --layout -f --prefix={params.prefix} -R {input.ref} -Q {input.fasta} --png {input.delta}
        """
