#!/bin/bash

cnvkit="/home/romanova_ov/anaconda3/pkgs/cnvkit-0.9.6a0-py36_2/bin/cnvkit.py"
bedfile="/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/Agilent_ExomeV6_S07604514_Padded.wochr.6bed.bed"
refFlat="/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/refFlatwoCHR.txt"
output="/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/my_targets.bed"

python $cnvkit target $bedfile --annotate $refFlat --split -o $output



