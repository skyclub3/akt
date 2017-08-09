#!/usr/bin/env bash

for i in pedphase/test*.vcf.gz;
do
    echo Testing $i
    ../akt pedphase $i -p pedphase/pedigree.fam -o - 2> /dev/null | grep -A1000 CHROM > ${i%vcf.gz}out
    diff ${i%vcf.gz}out ${i%.gz}
    ../akt pedphase $i -o - 2> /dev/null | grep -A1000 CHROM > ${i%vcf.gz}out
    diff ${i%vcf.gz}out ${i%.gz}
    echo "PASSED"
done

