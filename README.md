### Description
Although array comparative genomic hybridization (aCGH) is currently established as the gold standard for copy number variation (CNV) detection, next-generation sequencing (NGS) is increasingly being used to identify CNVs along with single nucleotide variants (SNVs) simultaneously. Using NGS to identify CNVs and SNVs could be of great benefit to laboratories, saving time and reducing costs while creating a more comprehensive picture of genomic variation with a single assay.
Here we have two pipelines CNVkit and ClinCNV using snakemake for detecting unknown variants of CNVs in patients. Pipelines were performed under the leadership of the researchers of Laboratory of Molecular Biology and Genetics of Federal Almazov Medical Research Center.

### Goal of project
Detecting of CNVs in patients with different types of idiopathic cardiomyopathies

### Methods
All work was performed on server
* https://cnvkit.readthedocs.io/en/stable/ - CNVkit
* https://github.com/imgag/ClinCNV - ClinCNV

### Files description

**/clincnv/Snakefile** - *ClinCNV's executable file for Snakemake. To run, simply type snakemake in terminal in project directory*

**/clincnv/config.yaml** - *ClinCNV's configuration file for Snakemake*

**/clincnv/prepare_reference.sh** - *.sh file to prepare a BED file of reference for use with ClinCNV*

**/clincnv/rules/** - *directory with pipeline's rules for ClinCNV:*
* 10_BedCoverage.smk - *Calculate coverage in the target and off-target regions from BAM read depths*
* 11_MergeFiles.smk - *Merge files from cohort for target  and off-target regions*
* 12_StartClinCNV.smk - *Launch of ClinCNV*

**/cnvkit/Snakefile** - *CNVkit's executable file for Snakemake. To run, simply type snakemake in terminal in project directory*

**/cnvkit/config.yaml** - *CNVkit's configuration file for Snakemake*

**/cnvkit/1_make_target_bed.sh** - *.sh file to prepare a BED file of target regions for use with CNVkit*

**/cnvkit/2_make_antitarget_bed.sh** - *.sh file to prepare a BED file of off-target regions for use with CNVkit*

**/cnvkit/rules/** - *directory with pipeline's rules for CNVkit:*
* 3_target_coverage.smk - *Calculate coverage in the target regions from BAM read depths*
* 4_antitarget_coverage.smk - *Calculate coverage in the off-target regions from BAM read depths*
* 5_make_a_reference.smk - *Create a “flat” reference of neutral copy number*
* 6_from_cnn_to_cnr.smk - *Combine the uncorrected target and off-target coverage tables (.cnn) and correct for biases in regional coverage and GC content, according to the given reference*
* 7_from_cnr_to_cns.smk - *Infer discrete copy number segments from the given coverage table*
* 8_make_a_scatter.smk - *Generate a static image scatter plot*
* 9_make_a_heatmap.smk - *Generate a heatmap of the larger-scale CNVs in a cohort*

### System requirements
* python 3
* anaconda3

Install CNVkit using conda:
```
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda install cnvkit
```

### References
* https://bmcbioinformatics.biomedcentral.com/articles/10.1186/1471-2105-14-S11-S1
* https://www.genengnews.com/magazine/306/the-next-generation-of-cnv-detection/
