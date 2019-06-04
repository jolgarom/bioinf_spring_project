rule make_a_reference:
    input: 
        target_coverage = "/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/analysis/{sample}.targetcoverage.cnn",
    output: 
        FlatReference = "/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/analysis/{sample}.reference.cnn",
    params:
        antitarget_coverage = "/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/analysis/{sample}.antitargetcoverage.cnn",
        reference = config["genome"],
    threads:
        14
    shell: "cnvkit reference {input.target_coverage} {params.antitarget_coverage} -f {params.reference} -o {output.FlatReference}"

