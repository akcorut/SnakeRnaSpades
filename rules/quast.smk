rule rnaQUAST:
    input:
        fasta="results/rnaspades/assembly/transcripts.fasta",
        ref="/work/jawlab/kivanc/PeanutRnaSeq/reference/arahy.Tifrunner.gnm1.KYV3.genome_main.fa",
        gtf="/work/jawlab/kivanc/PeanutRnaSeq/reference/tifrunner_gene_models.gtf"
    output:
        directory("results/rnaQUAST/results")
    log:
        "results/rnaQUAST/logs/rnaquast.log"
    conda:
        "envs/rnaquast.yaml"
    threads: 8
    shell:
        """
        rnaQUAST.py -t {threads} --blat -c {input.fasta} -r {input.ref} --gtf {input.gtf} -o {output}> {log}
        """

rule quast:
    input:
        fasta="results/rnaspades/assembly/transcripts.fasta",
        ref="/work/jawlab/kivanc/PeanutRnaSeq/reference/arahy.Tifrunner.gnm1.KYV3.genome_main.fa",
        gff="/work/jawlab/kivanc/PeanutRnaSeq/reference/arahy.Tifrunner.gnm1.ann1.CCJH.gene_models_main.gff3"
    output:
        directory("results/quast/results")
    log:
        "results/quast/logs/quast.log"
    conda:
        "envs/quast.yaml"
    threads: 10
    shell:
        """
        quast.py {input.fasta} -t {threads} --fragmented -r {input.ref} -g {input.gff} -o {output}> {log}
        """