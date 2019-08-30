rule multiqc:
    input:
        expand("results/quast/results"),
        expand("results/kallisto/logs/kallisto_quant_{smp}.log", smp=sample_id),
        expand("results/salmon/{smp}", smp=sample_id),
        expand("results/busco/full_table_busco.tsv")
    output:
        "results/multiqc/multiqc_report.html"
    log:
        "results/multiqc/logs/multiqc.log"
    wrapper:
        "0.31.1/bio/multiqc"