rule from_cnn_to_cnr:
    input:
        target_coverage = "/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/analysis/{sample}.targetcoverage.cnn",
    output:
        cnr_file = "/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/analysis/{sample}.cnr",
    params:
        antitarget_coverage = "/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/analysis/{sample}.antitargetcoverage.cnn",
        FlatReference = "/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/analysis/{sample}.reference.cnn",
    threads:
        14
    shell: "cnvkit fix {input.target_coverage} {params.antitarget_coverage} {params.FlatReference} -o {output.cnr_file}"
