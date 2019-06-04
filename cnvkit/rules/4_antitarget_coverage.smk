rule antitarget_coverage:
    input: 
        bam_file = "/mnt/IMBG-NGS-Analysys/StudentsWork/ExomesData/{sample}.bam",
    output: 
        antitarget_coverage = "/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/analysis/{sample}.antitargetcoverage.cnn",
    params:
        antitarget_regions = "/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/my_antitargets.bed",
    threads:
        14
    shell: "cnvkit coverage {input.bam_file} {params.antitarget_regions} -o {output.antitarget_coverage}"
