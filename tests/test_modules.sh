# test nanoplot
nextflow run \
    ../nf_assembly/tests/modules/nanoplot/main.nf \
    -entry NANO_FUNDULUS \
    -c ../nf_assembly/tests/nextflow.config \
    --outdir 'testresults/nanoplot_fundulus'

# test centrifuge
nextflow run \
    ../nf_assembly/tests/modules/centrifuge/main.nf \
    -entry CENTRIFUGE_FUNDULUS \
    -c ../nf_assembly/tests/nextflow.config \
    --outdir 'testresults/centrifuge_fundulus'