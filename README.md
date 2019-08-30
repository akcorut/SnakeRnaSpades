# SnakeRnaSpades
This snakemake workflow performs de novo transcriptome assembly, quality assessments and transcript quantifications.

**Steps:**

The workflow consists following steps:

- De novo transcriptome assembly ([rnaSPAdes](http://cab.spbu.ru/software/rnaspades/))
- Assembly quality control ([quast](http://bioinf.spbau.ru/quast), [transrate](http://hibberdlab.com/transrate/), [busco](https://busco.ezlab.org/))
- Alignment-free transcript quantification ([salmon](https://combine-lab.github.io/salmon/), [kallisto](https://pachterlab.github.io/kallisto/))

![dag](https://user-images.githubusercontent.com/42179487/64021040-12a94600-cb01-11e9-8277-2797c1906636.png)
