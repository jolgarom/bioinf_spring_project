rule make_a_heatmap:
    input:
        cns_file = "/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/analysis/{sample}.cns",
    output:
        heatmap_plot = "/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/results/{sample}_heatmap.png",
    threads:
        14
    shell: "cnvkit heatmap {input.cns_file} -o {output.heatmap_plot}"
