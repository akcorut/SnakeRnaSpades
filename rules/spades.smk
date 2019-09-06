rule spades:
    input:
        samples="leaf_samples.yaml"
    output:
        "results/rnaspades/assembly/transcripts.fasta"
    conda:
        "envs/spades.yaml"
    threads:24
    params:
        memory="200",
        outdir="results/rnaspades/assembly",
        kmer="25"
    shell:
        """
        rnaspades.py -k {params.kmer} --dataset {input.samples} -t {threads} -m {params.memory} --cov-cutoff auto -o {params.outdir}
        """