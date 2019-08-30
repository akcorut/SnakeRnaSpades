rule salmon_index:
    input:
        "results/rnaspades/assembly/transcripts.fasta"
    output:
        directory("results/salmon/transcriptome_index")
    log:
        "results/salmon/logs/transcriptome_index.log"
    threads: 8
    params:
        extra="-k 31 --type quasi"
    wrapper:
        "0.36.0/bio/salmon/index"

rule salmon_quant:
    input:
        r1 = "/scratch/ac32082/PeanutRnaSeq/results/trimmed/{smp}_R1_val_1.fq.gz",
        r2 = "/scratch/ac32082/PeanutRnaSeq/results/trimmed/{smp}_R2_val_2.fq.gz",
        index = "results/salmon/transcriptome_index"
    output:
        quant = 'results/salmon/{smp}/quant.sf',
        lib = 'results/salmon/{smp}/lib_format_counts.json'
    log:
        'results/salmon/logs/{smp}.log'
    params:
        # optional parameters
        libtype ="A",
        extra="--validateMappings --gcBias --seqBias --posBias --numBootstraps 30"
    threads: 8
    wrapper:
        "0.36.0/bio/salmon/quant"