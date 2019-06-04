rule from_cnr_to_cns:
    input: 
        cnr_file = "/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/analysis/{sample}.cnr",
    output: 
        cns_file = "/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/analysis/{sample}.cns",
    threads:
        14
    shell: "cnvkit segment {input.cnr_file} -o {output.cns_file}"

