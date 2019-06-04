#!/bin/bash

cnvkit="/home/romanova_ov/anaconda3/pkgs/cnvkit-0.9.6a0-py36_2/bin/cnvkit.py"
data="/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/access-5k-mappable-hg19woCHR.bed"
target_regions="/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/my_targets.bed"
antitarget_regions="/mnt/IMBG-NGS-Analysys/StudentsWork/romanova_ov/references/my_antitargets.bed"

python $cnvkit antitarget $target_regions -g $data -o $antitarget_regions




 





