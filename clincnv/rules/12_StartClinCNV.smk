rule StartClinCNV:
    input:
        mergedontarget='/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/analysis/mergedontarget.cov',
        mergedofftarget='/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/analysis/mergedofftarget.cov',
    output:
        directory("/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/results/clincnv/"),
    threads:
        14
    shell:
        r"""
        Rscript /home/romanova_ov/software/ClinCNV/clinCNV.R \
        --normal {input.mergedontarget} \
        --normalOfftarget {input.mergedofftarget} \
        --bed /mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/ClinCNVRef_AKis/AgilentExomeV6Design_S07604514_Covered.gcannotated.genes.bed \
        --bedOfftarget /mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/ClinCNVRef_AKis/AgilentExomeV6Design_S07604514_Covered.offtarget.chunk.shrink25K.gcannotated.extended400.bed \
        --out {output} \
        --folderWithScript /home/romanova_ov/software/ClinCNV/ \
        --numberOfThreads {threads}
        """