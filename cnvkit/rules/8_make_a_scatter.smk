rule make_a_scatter:
    input:
        cnr_file = "/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/analysis/{sample}.cnr",
    output:
        scatter_plot = "/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/results/{sample}_scatter.png",
    params:
        cns_file = "/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/analysis/{sample}.cns",
    threads:
        14
    shell: "cnvkit scatter {input.cnr_file} -s {params.cns_file} -o {output.scatter_plot}"
