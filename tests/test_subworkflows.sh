# test longread_qc
nextflow run \
    ../nf_assembly/tests/subworkflows/longread_qc/main.nf \
    -entry LONGREAD_QC_FUNDULUS \
    -c ../nf_assembly/tests/nextflow.config \
    --outdir 'testresults/longread_qc'

# test longread_qc, no centrifuge
nextflow run \
    ../nf_assembly/tests/subworkflows/longread_qc/main.nf \
    -entry LONGREAD_QC_FUNDULUS \
    -c ../nf_assembly/tests/nextflow.config \
    --outdir 'testresults/longread_qc_nofilter' \
    --centrifugedb false