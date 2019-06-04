#!/bin/bash

BedExtend -in /mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/Agilent_ExomeV6_S07604514_Padded.bed -n 400 | BedMerge -out /mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/Agilent_ExomeV6_S07604514_Padded_extended400.bed

BedSubtract -in /mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/human_g1k_v37.bed -in2 /mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/Agilent_ExomeV6_S07604514_Padded_extended400.bed -out /mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/Agilent_ExomeV6_S07604514_Padded_extended400_offtarget.bed

BedChunk -in /mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/Agilent_ExomeV6_S07604514_Padded_extended400_offtarget.bed -n 50000 -out /mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/Agilent_ExomeV6_S07604514_Padded_extended400_offtarget_chunk.bed

BedShrink -in /mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/Agilent_ExomeV6_S07604514_Padded_extended400_offtarget_chunk.bed -n 12500 | BedExtend -n 12500 -out /mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/Agilent_ExomeV6_S07604514_Padded_extended400_offtarget_chunk_shrink.bed

BedAnnotateGC -in /mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/Agilent_ExomeV6_S07604514_Padded_extended400_offtarget_chunk_shrink.bed -out /mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/Agilent_ExomeV6_S07604514_Padded_extended400_offtarget_chunk_shrink_gcannotated.bed -ref /mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/human_g1k_v37.fasta

awk -v OFS='\t' '{print $1,$2,$3}' /mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/Agilent_ExomeV6_S07604514_Padded.bed > /mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/Agilent_ExomeV6_S07604514_Padded.3bed.bed

BedAnnotateGC -in /mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/Agilent_ExomeV6_S07604514_Padded.3bed.bed -out /mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/Agilent_ExomeV6_S07604514_Padded_gcannotated.bed -ref /mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/human_g1k_v37.fasta

cat /mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/gencode.v28.annotation.gtf | awk '$3 == "gene"' - | convert2bed -i gff - > /mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/gencode.v28.genes.bed

cat /mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/gencode.v28.annotation.gtf | awk 'OFS="\t" {if ($3=="gene") {print $1,$4-1,$5,$14,$16,$7}}' | tr -d '";' > /mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/gencode.v28.genes.bed

BedAnnotateFromBed -in2 /mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/gencode.v28.genes.bed -in /mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/Agilent_ExomeV6_S07604514_Padded_gcannotated.bed -out /mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/Agilent_ExomeV6_S07604514_Padded_gcannotated_genes.bed

BedAnnotateFromBed -in2 /mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/gencode.v28.genes.bed -in /mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/Agilent_ExomeV6_S07604514_Padded_gcannotated.bed -out /mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/Agilent_ExomeV6_S07604514_Padded_extended400_offtarget_chunk_shrink_gcannotated_genes.bed

awk '{ print $1,$2-10,$3+10}' OFS="\t" /mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/gencode.v28.genes.bed > /mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/gencode.v28.genes_st1.bed

BedAnnotateGenes -in /mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/Agilent_ExomeV6_S07604514_Padded_extended400_offtarget_chunk_shrink_gcannotated.bed -out /mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/Agilent_ExomeV6_S07604514_Padded_extended400_offtarget_chunk_shrink_genes_gcannotated.bed