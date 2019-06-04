rule target_coverage:
    input: 
        bam_file = "/mnt/IMBG-NGS-Analysys/StudentsWork/ExomesData/{sample}.bam",
    output: 
        target_coverage = "/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/analysis/{sample}.targetcoverage.cnn",
    params:
        target_regions = "/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/my_targets.bed",
    threads:
        14
    shell: "cnvkit coverage {input.bam_file} {params.target_regions} -o {output.target_coverage}"

