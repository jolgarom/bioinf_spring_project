rule BedCoverage:
    input: 
        bam_file="/mnt/IMBG-NGS-Analysys/StudentsWork/ExomesData/{sample}.bam",
    output: 
        cov_ontarget="/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/analysis/ontarget/{sample}.ontarget.cov",
        cov_offtarget="/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/analysis/offtarget/{sample}.offtarget.cov",
    params:
        bedofftarget="/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/ClinCNVRef_AKis/AgilentExomeV6Design_S07604514_Covered.offtarget.chunk.shrink25K.gcannotated.extended400.bed",
        bedontarget="/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/ClinCNVRef_AKis/AgilentExomeV6Design_S07604514_Covered.bed",
    threads:
        14
    shell:
        r"""
        /home/romanova_ov/anaconda3/bin/BedCoverage \
        -bam {input.bam_file} \
        -in {params.bedontarget} \
        -min_mapq 5 \
        -decimals 4 > {output.cov_ontarget}
        
        /home/romanova_ov/anaconda3/bin/BedCoverage \
        -bam {input.bam_file} \
        -in {params.bedofftarget} \
        -min_mapq 5 \
        -decimals 4 > {output.cov_offtarget}
        """