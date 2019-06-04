rule MergeFiles:
    input: 
        files_for_ontarget="/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/analysis/ontarget/",
        files_for_offtarget="/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/analysis/offtarget/",
    output: 
        mergedontarget='/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/analysis/mergedontarget.cov',
        mergedofftarget='/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/analysis/mergedofftarget.cov',
    threads:
        14
    shell:
        r"""
        Rscript /home/romanova_ov/software/ClinCNV/mergeFilesFromFolder.R \
        -i {input.files_for_ontarget} \
        -o {output.mergedontarget}
        
        Rscript /home/romanova_ov/software/ClinCNV/mergeFilesFromFolder.R \
        -i {input.files_for_offtarget} \
        -o {output.mergedofftarget}
        """
