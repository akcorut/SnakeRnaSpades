# SnakeRnaSpades
This snakemake workflow performs de novo transcriptome assembly, quality assessments and transcript quantifications.

**Steps:**

The workflow consists following steps:

- De novo transcriptome assembly ([rnaSPAdes](http://cab.spbu.ru/software/rnaspades/))
- Assembly quality control ([quast](http://bioinf.spbau.ru/quast), [transrate](http://hibberdlab.com/transrate/), [busco](https://busco.ezlab.org/))
- Alignment-free transcript quantification ([salmon](https://combine-lab.github.io/salmon/), [kallisto](https://pachterlab.github.io/kallisto/))

![dag](https://user-images.githubusercontent.com/42179487/64022066-6026b280-cb03-11e9-80e1-05a76d51e20e.png)
